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
                    NavigationLink("Results", destination: ResultView())
                    NavigationLink("Achievements", destination: EmptyView())
                    NavigationLink("About author", destination: AuthorView())
                    Text("Logout")
                        .onTapGesture {
                            service.firebaseService.logout()
                            appState.flow = .authorization
                        }
                }
            }
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}
