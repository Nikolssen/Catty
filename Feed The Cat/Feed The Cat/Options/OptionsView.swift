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
                    NavigationLink("Instruction", destination: EmptyView())
                    NavigationLink("Results", destination: ResultView())
                    NavigationLink("Achievements", destination: EmptyView())
                    NavigationLink("About author", destination: AuthorView())
                    Text("Logout")
                        .onTapGesture {
                            service.firebaseService.logout()
                            appState.state = .authorization
                        }
                }
            }
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Molle-Regular", size: 32)!, .foregroundColor: UIColor(Resources.Colors.main)]
        UITableView.appearance().backgroundColor = UIColor(Resources.Colors.background)
        UINavigationBar.appearance().barTintColor = UIColor(Resources.Colors.background)
        UIBarButtonItem.appearance().tintColor = UIColor(Resources.Colors.main)        
    }
}
