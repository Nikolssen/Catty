//
//  GameItem.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import Foundation
import SwiftUI

struct GameItem {
    enum Kind {
        case bottle
        case toxic
        case milk
        case burger
        case fish
        case sausage
        case life
    }
    
    let kind: Kind
    var position: CGFloat
    
    var image: Image {
        switch kind {
        case .bottle:
            return Resources.Images.bottle
        case .toxic:
            return Resources.Images.toxic
        case .milk:
            return Resources.Images.milk
        case .burger:
            return Resources.Images.milk
        case .life:
            return Image(systemName: "heart.fill")
        case .fish:
            return Resources.Images.fish
        case .sausage:
            return Resources.Images.sausage
        }
    }
    
    var isEatable: Bool {
        switch kind {
        case .bottle, .toxic:
            return false
        default:
            return true
        }
    }
    
    static var random: GameItem {
        let kind = [Kind.life, Kind.milk, Kind.toxic, Kind.bottle, Kind.burger, Kind.sausage, Kind.fish].randomElement()!
        return GameItem(kind: kind, position: 1.0)
    }
}

