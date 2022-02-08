//
//  AnimatedLaunchScreen.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/7/22.
//

import SwiftUI

struct AnimatedLaunchScreen: View {
    @State var animation: Bool = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            Resources.Images.cat
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, animation ? 50 : 100)
                .animation(.spring(response: 0.2).repeatForever(autoreverses: true), value: animation)
                .onAppear {
                    animation = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        appState.state = .authorization
                    }
                }
        }        
    }
}

struct AnimatedLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLaunchScreen()
    }
}
