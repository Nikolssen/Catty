//
//  MainView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/5/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CatView()
                .tabItem {
                    Label("Play!", systemImage: "gamecontroller")
                }
                .tag(0)
            Text("Results")
                .tabItem {
                    Label("Results", systemImage: "flag.2.crossed")
                }
                .tag(1)
            Text("About Author")
                .tabItem {
                    Label("Author", systemImage: "graduationcap")
                }
                .tag(2)
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
