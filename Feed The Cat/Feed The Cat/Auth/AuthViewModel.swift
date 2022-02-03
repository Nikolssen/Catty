//
//  AuthViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Combine

class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    var loginSubject: PassthroughSubject<Void, Never> = .init()
    
}

