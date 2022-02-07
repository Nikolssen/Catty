//
//  FirebaseService.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Firebase
import FirebaseAuth
import Combine

final class FirebaseService {
    
    var currentPlayer: String?
    
    func signIn(email: String, password: String) -> AnyPublisher<AuthDataResult, NSError> {
        return Deferred {
            return Future { future in
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        future(.failure(error as NSError))
                    }
                    else {
                        future(.success(result!))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func createUser(email: String, password: String) -> AnyPublisher<AuthDataResult, NSError>{
        return Deferred{
            return Future {
                future in
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        future(.failure(error as NSError))
                    }
                    else {
                        future(.success(result!))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func logout() {
        try? Auth.auth().signOut()
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
