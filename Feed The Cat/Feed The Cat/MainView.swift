//
//  MainView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/5/22.
//

import SwiftUI

struct MainView: View {
    

    @EnvironmentObject var service: Service
    @EnvironmentObject var appState: AppState
    
    var body: some View {
            switch appState.flow {
            case .launchScreen:
                AnimatedLaunchScreen()
            case .authorization:
                AuthView(viewModel: .init(service: service))
                    .transition(.slide)
            case .registration:
                RegisterView(viewModel: .init(service: service))
                    .transition(.slide)
            case .tabBar:
                TabView {
                    CatView(state: .init(service: service))
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
                .accentColor(Color(UIColor.clear))
                .transition(.slide)
                
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
