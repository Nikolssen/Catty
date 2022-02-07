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
                Resources.Colors.background
                    .ignoresSafeArea()
                List {
                    Text("Instruction")
                    NavigationLink("Results", destination: ResultView())
                    Text("Achievements")
                    NavigationLink("About author", destination: AuthorView())
                }
                .font(Resources.Fonts.molle(size: 18))
            }
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.large)
        }

    }
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Molle-Regular", size: 32)!, .foregroundColor: UIColor(Resources.Colors.main)]
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
