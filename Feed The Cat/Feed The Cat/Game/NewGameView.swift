//
//  NewGameView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import SwiftUI

struct NewGameView: View {
    var state: GameState
    @State private var shareResult: Bool = false
    var body: some View {
        VStack {
            if let result = state.lastGameResult {
                HStack {
                    Text("You lost! Your score is \(result.score)")
                        .foregroundColor(Resources.Colors.main)
                        .font(Resources.Fonts.molle(size: 24))
                    Button(action: { shareResult = true }) { Image(systemName: "square.and.arrow.up") }
                        .foregroundColor(Resources.Colors.main)
                }
                .padding(.horizontal, 35)
                .sheet(isPresented: $shareResult, content: {ActivityView(activityItems: ["I got \(result.score) points in Play the Cat Game!!!"])})
            }
            RedButton(text: "New Game!", action: { state.newGame() })
        }

        

    }
}
