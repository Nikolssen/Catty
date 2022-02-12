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
                               let timestamp = data["date"] as? Timestamp {
                                return ResultInfo(date: timestamp.dateValue(), score: score, player: player)
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
    
    func getUserAchievements(userUID: String) -> AnyPublisher<[String], NSError> {
        return Deferred {
            return Future { future in
                let database = Firestore.firestore()
                database.collection("achievements").whereField("uid", isEqualTo: userUID).getDocuments { snapshot, error in
                    if let snapshot = snapshot {
                        let result = snapshot.documents.compactMap { document -> String? in
                            let data  = document.data()
                            if let name = data["name"] as? String {
                                return name
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
    
    func publishUserResult(result: ResultInfo) {
        let database = Firestore.firestore()
        if let userUID = Firebase.Auth.auth().currentUser?.uid
        {
            database.collection("games").addDocument(data: ["date" : result.date, "score" : result.score, "player" : result.player, "uid" : userUID]) { error in
                
            }
        }
    }
    func publishUserAchievement(name: String) {
        
        let database = Firestore.firestore()
        if let userUID = Firebase.Auth.auth().currentUser?.uid
        {
            database.collection("achievements").addDocument(data: ["name" : name, "uid" : userUID]) { error in
                
            }
            
        }
    }
}
