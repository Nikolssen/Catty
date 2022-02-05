//
//  GameState.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import Foundation
import Combine

class GameState: ObservableObject {
    @Published var lives: Int = 2
    @Published var satiety: Int = 0
    @Published var models: [GameItem] = []
    
    func feed() {
        if let index = models.firstIndex(where: { $0.position > 0.47 && $0.position < 0.53})  {
            let model = models[index]
            models.remove(at: index)
            if model.kind == .life && lives < 3 {
                lives += 1
                return
            }
            if model.isEatable {
                satiety += 1
            }
            else {
                lives -= 1
            }
        }
    }
}
