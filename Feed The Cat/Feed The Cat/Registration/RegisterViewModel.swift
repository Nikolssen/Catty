//
//  RegisterViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Combine

class RegisterViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""

    var registerSubject: PassthroughSubject<Void, Never> = .init()
}

