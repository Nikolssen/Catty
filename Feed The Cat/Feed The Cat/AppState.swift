//
//  AppState.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import Foundation
import Combine

final class AppState: ObservableObject {
    
    enum Flow {
        case launchScreen
        case authorization
        case registration
        case tabBar
    }
    
    @Published var flow: AppState.Flow = .launchScreen
}
