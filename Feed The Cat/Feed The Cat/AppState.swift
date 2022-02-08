//
//  AppState.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import Foundation
import Combine

class AppState: ObservableObject {
    
    enum ApplicationState {
        case launchScreen
        case authorization
        case registration
        case tabBar
    }
    
    @Published var state: AppState.ApplicationState = .launchScreen
}
