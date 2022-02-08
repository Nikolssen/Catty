//
//  MainView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/5/22.
//

import SwiftUI

struct MainView: View {
    @State var showLaunch: Bool = true
    var body: some View {
        ZStack {
            if showLaunch {
                AnimatedLaunchScreen()
            }
            else {
                TabView {
                    CatView()
                        .tabItem {
                            Label("Play!", systemImage: "gamecontroller")
                        }
                        .tag(0)
                    OptionsView()
                        .tabItem {
                            Label("Options", systemImage: "flag.2.crossed")
                        }
                        .tag(1)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showLaunch = false
            }
        }

    }
    
    init() {
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.selected.iconColor = UIColor(Resources.Colors.main)
        itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(Resources.Colors.main)]
        
        let appeareance = UITabBarAppearance()
        appeareance.stackedLayoutAppearance = itemAppearance
        appeareance.inlineLayoutAppearance = itemAppearance
        appeareance.compactInlineLayoutAppearance = itemAppearance

        UITabBar.appearance().standardAppearance = appeareance
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
