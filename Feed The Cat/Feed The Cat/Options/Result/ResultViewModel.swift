//
//  ResultViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import Foundation
import Combine

class ResultViewModel: ObservableObject {
    @Published var results: [ResultInfoViewModel]?
    let startSubject: PassthroughSubject<Void, Never> = .init()
}
