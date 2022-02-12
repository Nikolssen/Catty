//
//  ResultViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import Foundation
import Combine

extension DateFormatter {
    static var extendedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, HH:mm"
        return formatter
    }()
    
    static func convert(date: Date) -> String {
        let formatter = extendedDateFormatter
        return formatter.string(from: date)
    }
}

final class ResultViewModel: ObservableObject {
    @Published var results: [ResultInfoViewModel]?
    @Published var isLoading: Bool = false
    let startSubject: PassthroughSubject<Void, Never> = .init()
    let service: Service
    var subscriptions: Set<AnyCancellable> = .init()
    init(service: Service) {
        self.service = service
        
        startSubject
            .setFailureType(to: NSError.self)
            .compactMap { [service] in service.firebaseService.playerUID }
            .handleEvents(receiveOutput: { [weak self] _ in self?.isLoading = true })
            .receive(on: DispatchQueue.global(qos: .background))
            .flatMapLatest {[service] in
                service.firebaseService.getUserResults(userUID: $0)
            }
            .map { $0.sorted { $0.date > $1.date } }
            .map {
                var array: [ResultInfoViewModel] = []
                for (index, value) in $0.enumerated() {
                    array.append(.init(date: DateFormatter.convert(date: value.date), score: String(value.score), player: value.player, index: index))
                }
                return array
            }
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { [weak self] _ in self?.isLoading = false })
            .retry(1)
            .sink(receiveCompletion: {_ in  }, receiveValue: {[weak self] models in self?.results = models })
            .store(in: &subscriptions)
    }
}
