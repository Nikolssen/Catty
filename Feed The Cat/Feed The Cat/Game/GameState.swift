//
//  GameState.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import UIKit
import Combine

final class GameState: ObservableObject {
    @Published var lives: Int = 2
    @Published var satiety: Int = 0
    @Published var showingActivity: Bool = false
    let service: Service
    private(set) var lastGameResult: ResultInfo?
    private(set) var isGameStarted: Bool = false
    private(set) var models: [GameItem] = []
    
    init(service: Service) {
        self.service = service
    }
    
    func feed() {
        if let index = models.firstIndex(where: { $0.position > 0.47 && $0.position < 0.53})  {
            let model = models[index]
            models.remove(at: index)
            if model.kind == .life {
                if lives < 3 {
                    lives += 1
                }
                return
            }
            if model.isEatable {
                satiety += 1
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                showingActivity.toggle()
            }
            else {
                lives -= 1
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                if lives == 0 {
                    let result = ResultInfo(date: .now, score: satiety, player: service.firebaseService.currentPlayer ?? "Unknown Player")
                    lastGameResult = result
                    report(result: result)
                    isGameStarted = false
                }
            }
        }
    }
    
    func update() {
        for index in 0..<models.count {
            models[index].position -= 0.005
        }
        
        if let first = models.first?.position, first <= 0.00 {
            _ = models.removeFirst()
        }
        if let last = models.last?.position, last <= 0.71 {
            models.append(GameItem.random)
        }
        if models.isEmpty {
            models.append(GameItem.random)
        }
    }
    
    func newGame() {
        satiety = 0
        lives = 2
        isGameStarted = true
    }
    
    func report(result: ResultInfo) {
        
    }
}
