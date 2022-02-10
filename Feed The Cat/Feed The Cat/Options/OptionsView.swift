//
//  OptionsView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/7/22.
//

import SwiftUI

struct OptionsView: View {
    @EnvironmentObject var service: Service
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationView {
            ZStack {
                
                List {
                    NavigationLink("Instruction", destination: InstructionView())
                    NavigationLink("Results", destination: ResultView(viewModel: .init(service: service)))
                    NavigationLink("Achievements", destination: AchievementsListView(viewModel: .init(service: service)))
                    NavigationLink("About author", destination: AuthorView())
                    Text("Logout")
                        .onTapGesture {
                            service.firebaseService.logout()
                            withAnimation {
                                appState.flow = .authorization
                            }
                        }
                }
            }
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}
