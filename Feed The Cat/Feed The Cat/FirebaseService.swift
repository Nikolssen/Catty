//
//  FirebaseService.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

final class FirebaseService {
    
    var currentPlayer: String? {
        authResult?.user.email ?? authResult?.user.displayName
    }
    
    var playerUID: String? {
        authResult?.user.uid
    }
    
    private var authResult: AuthDataResult?
    
    func signIn(email: String, password: String) -> AnyPublisher<Void, NSError> {
        return Deferred { [weak self] in
            return Future { future in
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        future(.failure(error as NSError))
                    }
                    else {
                        future(.success(Void()))
                        self?.authResult = result
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func createUser(email: String, password: String) -> AnyPublisher<Void, NSError>{
        return Deferred{ [weak self] in
            return Future {
                future in
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        future(.failure(error as NSError))
                    }
                    else {
                        future(.success(Void()))
                        self?.authResult = result
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func logout() {
        try? Auth.auth().signOut()
        authResult = nil
    }
    
    func getUserResults(userUID: String) -> AnyPublisher<[ResultInfo], NSError> {
        return Deferred {
            return Future { future in
                let database = Firestore.firestore()
                database.collection("games").whereField("uid", isEqualTo: userUID).getDocuments { snapshot, error in
                    if let snapshot = snapshot {
                        let result = snapshot.documents.compactMap { document -> ResultInfo? in
                            let data  = document.data()
                            if let score = data["score"] as? Int,
                               let player = data["player"] as? String,
                               let date = data["date"] as? Date {
                                return ResultInfo(date: date, score: score, player: player)
                            }
                            return nil
                        }
                        future(.success(result))
                    }
                    else if let error = error as NSError? {
                        future(.failure(error))
                    }
                }
                
            }
        }
        .eraseToAnyPublisher()
    }
    
    func publishUserResult(result: ResultInfo) -> AnyPublisher<Void, NSError> {
        return Deferred {
            return Future { future in
                let database = Firestore.firestore()
                if let userUID = Firebase.Auth.auth().currentUser?.uid
                {
                    database.collection("games").addDocument(data: ["date" : result.date, "score" : result.score, "player" : result.player, "uid" : userUID]) { error in
                        if let error = error as NSError? {
                            future(.failure(error))
                        }
                        else {
                            future(.success(Void()))
                        }
                    }
                }
                else {
                    future(.failure(NSError(domain: "Failed to publish result", code: 20000, userInfo: nil)))
                }
                
            }
            
        }
        .eraseToAnyPublisher()
    }
    //
    //    func signIn(googleCredentials: AuthCredential) -> Single<AuthDataResult>{
    //        return Single<AuthDataResult>.create{
    //            single in
    //            Auth.auth().signIn(with: googleCredentials){
    //                result, error in
    //                if let error = error {
    //                    single(.failure(error))
    //                }
    //                else {
    //                    single(.success(result!))
    //                }
    //
    //            }
    //            return Disposables.create()
    //        }
    //    }
}
