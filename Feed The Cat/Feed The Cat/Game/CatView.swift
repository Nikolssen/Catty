//
//  CatView.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import SwiftUI

struct CatView: View {
    @StateObject var state: GameState
    var body: some View {
        
        NavigationView {
            ZStack {
                Resources.Colors.background
                    .ignoresSafeArea()
                VStack {
                    if state.isGameStarted {
                        HUDView(lives: state.lives, satiety: state.satiety)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Resources.Images.cat
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 50)
                        .rotationEffect(.degrees(state.showingActivity ? 360.0 : 0.0))
                    if state.isGameStarted {
                        GameView(state: state)
                            .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 100, maxHeight: 100, alignment: .center)
                        RedButton(text: Constants.actionText, action: { withAnimation { state.feed() }  })
                    } else {
                        NewGameView(state: state)
                    }
                    Spacer()
                }
                
                
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(Constants.title)
            
        }
        
    }
    
    private enum Constants {
        static let title: String = "Feed the cat"
        static let actionText = "Feed"
    }
}
