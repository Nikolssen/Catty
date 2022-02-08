//
//  AuthViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Combine
import Foundation
import CombineExt
import FirebaseAuth
import Firebase

extension String {
    
    var isValidEmail: Bool {
        if self.isEmpty {
            return false
        }
        
        let regexp = try! NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$")
        return regexp.numberOfMatches(in: self, options: [], range: _NSRange(location: 0, length: self.utf16.count)) == 1
    }
    
    var isValidPassword: Bool {
        return self.count >= 6
    }
    
}

class AuthViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isAuthorized: Bool = false
    
    let service: Service
    var loginSubject: PassthroughSubject<Void, Never> = .init()
    var subscribtions: Set<AnyCancellable> = .init()
    
    init(service: Service) {
        self.service = service
        
        let validationPublisher =
        loginSubject
            .withLatestFrom($email, $password)
            .map { (isValid: $0.isValidEmail && $1.isValidPassword, email: $0, password: $1) }
            
        validationPublisher
            .filter { $0.isValid }
            .setFailureType(to: NSError.self)
            .receive(on: DispatchQueue.global(qos: .background))
            .flatMapLatest { [service] (_, email, password) -> AnyPublisher<Void, NSError> in
                service.firebaseService.signIn(email: email, password: password)
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: {} , receiveCompletion: { error in })
            .retry(1)
            .sink(receiveCompletion: {_ in }, receiveValue: {})
            .store(in: &subscribtions)
    }
}

