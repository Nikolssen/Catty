//
//  CatView.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import SwiftUI

struct CatView: View {
    var body: some View {
        NavigationView {
            VStack {
               
                Resources.Images.cat
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
                
                Button(action: {}) {
                    Text(Constants.actionText)
                        .font(Resources.Fonts.gnuolane(size: 24))
                        .foregroundColor(Resources.Colors.background)
                        .frame(minWidth: 30, maxWidth: .infinity, minHeight: 20, maxHeight: 50, alignment: .center)
                        .background(Resources.Colors.main)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding(.horizontal, 30)
                        .shadow(color: Resources.Colors.main.opacity(0.3), radius: 5, x: 5, y: 5)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(Constants.title)

        }
        .ignoresSafeArea()
        .background(Resources.Colors.background)


    }
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "gnuolane", size: 32)!, .foregroundColor: UIColor(Resources.Colors.main)]
    }
    
    enum Constants {
        static let title: String = "Feed the cat"
        static let actionText = "Feed"
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
