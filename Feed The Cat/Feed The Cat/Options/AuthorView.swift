//
//  AuthorView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/6/22.
//

import SwiftUI

struct AuthorView: View {
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Feed The Cat")
                Text("By Ivan Budovich")
                Text("BSUIR, 951002 group")
                Spacer()
                Text("2022")
            }
            .font(Resources.Fonts.molle(size: 19))
            
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
