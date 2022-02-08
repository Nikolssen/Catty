//
//  GameView.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import SwiftUI

struct GameView: View {
    
    let state: GameState
    
    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.005)) {timelineContext in
            AnimatedView(date: timelineContext.date, state: state)
        }
    }
}

