//
//  AnimatedLaunchScreen.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/7/22.
//

import SwiftUI

struct AnimatedLaunchScreen: View {
    @State var animation: Bool = false
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            Resources.Images.cat
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, animation ? 50 : 100)
                .animation(.spring().repeatForever(autoreverses: true), value: animation)
                .onAppear {
                    animation = true
                }
        }        
    }
}

struct AnimatedLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedLaunchScreen()
    }
}
