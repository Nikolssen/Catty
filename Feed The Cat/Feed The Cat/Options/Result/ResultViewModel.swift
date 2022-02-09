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
    let service: Service
    
    init(service: Service) {
        self.service = service
        
        startSubject
            .setFailureType(to: NSError.self)
            .compactMap { [service] in service.firebaseService.playerUID }
            .receive(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveOutput: { [weak self] _ in self?.isLoading = true })
            .flatMapLatest {[service] in
                service.firebaseService.getUserResults(userUID: $0)
            }
            .map {
                var array: [ResultInfoViewModel] = []
                for (index, value) in $0.enumerated() {
                    array.append(.init(result: value, index: index))
                }
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { [weak self] _ in self?.isLoading = false })
            .retry(1)
//            .sink(receiveCompletion: { [weak self] models in
//                self?.results = models
//            })
    }
}
