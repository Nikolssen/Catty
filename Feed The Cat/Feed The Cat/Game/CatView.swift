//
//  CatView.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import SwiftUI

struct CatView: View {
    @StateObject private var gameState: GameState = .init()
    var body: some View {

            NavigationView {
                ZStack {
                    Resources.Colors.background
                        .ignoresSafeArea()
                VStack {
                    HUDView(lives: gameState.lives, satiety: gameState.satiety)
                        .padding(.horizontal)
                    Spacer()
                    Resources.Images.cat
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 50)
                        .rotationEffect(.degrees(gameState.showingActivity ? 360.0 : 0.0))
                    
                    GameView(state: gameState)
                        .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 100, maxHeight: 100, alignment: .center)
                    Button(action: { withAnimation { gameState.feed() }  }) {
                        Text(Constants.actionText)
                            .font(Resources.Fonts.molle(size: 24))
                            .foregroundColor(Resources.Colors.background)
                            .frame(minWidth: 30, maxWidth: .infinity, minHeight: 20, maxHeight: 50, alignment: .center)
                    }
                    .buttonStyle(.borderless)
                    .background(Resources.Colors.main)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .shadow(color: Resources.Colors.main.opacity(0.3), radius: 5, x: 5, y: 5)
                    .padding(.horizontal, 30)
                    Spacer()
                }

                
            }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle(Constants.title)
            
        }
        
    }
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Molle-Regular", size: 32)!, .foregroundColor: UIColor(Resources.Colors.main)]
    }
    
    enum Constants {
        static let title: String = "Feed the cat"
        static let actionText = "Feed"
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
