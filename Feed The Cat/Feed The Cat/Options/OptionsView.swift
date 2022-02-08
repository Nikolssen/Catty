//
//  OptionsView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/7/22.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                List {
                    NavigationLink("Instruction", destination: EmptyView())
                    NavigationLink("Results", destination: ResultView())
                    NavigationLink("Achievements", destination: EmptyView())
                    NavigationLink("About author", destination: AuthorView())
                    Text("Logout")
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

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
