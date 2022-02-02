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
        case life
    }
    
    let kind: Kind
    let position: CGFloat
    
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
        }
    }
}

