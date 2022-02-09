//
//  ResultViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import Foundation
import Combine

final class ResultViewModel: ObservableObject {
    @Published var results: [ResultInfoViewModel]?
    @Published var isLoading: Bool = false
    let startSubject: PassthroughSubject<Void, Never> = .init()
}
