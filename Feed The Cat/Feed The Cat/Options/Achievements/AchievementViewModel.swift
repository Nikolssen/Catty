//
//  AchievementViewModel.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/10/22.
//

import Foundation
import Combine

class AchievementViewModel: ObservableObject {
    let service: Service
    @Published var isLoading: Bool = false
    let startSubject: PassthroughSubject<Void, Never> = .init()
    var subscriptions: Set<AnyCancellable> = .init()
    @Published var models: [AchievementViewViewModel]?
    private var achievements: [Achievement] = [
        .init(image: Resources.Images.molotov, name: "Molotov's Cat", description: "Survive after taking five poisons in one game."),
        .init(image: Resources.Images.superCat, name: "A cat that has nine lives", description: "Die after taking nine poisonous substantions in one game.")
    ]
    
    init(service: Service) {
        self.service = service
        
        startSubject
            .compactMap { [service] in service.firebaseService.playerUID }
            .handleEvents(receiveOutput: {[weak self] _ in self?.isLoading = true} )
            .setFailureType(to: NSError.self)
            .receive(on: DispatchQueue.global(qos: .background))
            .flatMapLatest { [service] in service.firebaseService.getUserAchievements(userUID: $0)}
            .map { [weak self] array -> [AchievementViewViewModel] in
                guard let self = self else { return [] }
                var models = [AchievementViewViewModel]()
                for (index, model) in self.achievements.enumerated() {
                    models.append(.init(index: index, achievement: model, isPosessed: array.contains(model.name)))
                }
                return models
            }
            .receive(on: DispatchQueue.main)
            .retry(1)
            .handleEvents(receiveOutput: { [weak self] _ in self?.isLoading = false })
            .sink(receiveCompletion: {_ in  }, receiveValue: {[weak self] models in self?.models = models })
            .store(in: &subscriptions)
            
    }
    
}
