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
}
