//
//  RegisterViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Combine
import Foundation

final class RegisterViewModel: ObservableObject {

    
    @Published var email: String = ""
    @Published var password: String = ""
    let service: Service
    var registerSubject: PassthroughSubject<Void, Never> = .init()
    var subscribtions: Set<AnyCancellable> = .init()
    @Published var isAuthorized: Bool = false
    @Published var showAlert: Bool = false
    
    init(service: Service) {
        self.service = service
        
        let validationPublisher =
        registerSubject
            .withLatestFrom($email, $password)
            .map { (isValid: $0.isValidEmail && $1.isValidPassword, email: $0, password: $1) }
            
        validationPublisher
            .filter { $0.isValid }
            .setFailureType(to: NSError.self)
            .receive(on: DispatchQueue.global(qos: .background))
            .flatMapLatest { [service] (_, email, password) -> AnyPublisher<Void, NSError> in
                service.firebaseService.createUser(email: email, password: password)
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveCompletion: { [weak self] _ in self?.showAlert = true })
            .retry(1)
            .sink(receiveCompletion: {_ in }, receiveValue: { [weak self] in self?.isAuthorized = true })
            .store(in: &subscribtions)
        
        validationPublisher
            .filter { !$0.isValid }
            .map { _ in Void() }
            .sink(receiveValue: { [weak self] in self?.showAlert = true })
            .store(in: &subscribtions)
    }
    
}

