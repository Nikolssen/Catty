//
//  AuthView.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import SwiftUI

struct AuthView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            VStack {
                Resources.Images.cat
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
                
                AuthTextField(isSecure: false, text: $username, placeholder: "Username")
                AuthTextField(isSecure: false, text: $password, placeholder: "Password")
                
                
                Button(action: {}) {
                    Text("Login")
                        .font(Resources.Fonts.gnuolane(size: 24))
                        .foregroundColor(Resources.Colors.background)
                        .frame(minWidth: 30, maxWidth: .infinity, minHeight: 20, maxHeight: 50, alignment: .center)
                        .background(Resources.Colors.main)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding(.horizontal, 30)
                        .shadow(color: Resources.Colors.main.opacity(0.3), radius: 5, x: 5, y: 5)
                }
                
                Button(action: {}) {
                    Text("Login with Game Center")
                        .foregroundColor(Resources.Colors.main)
                        .font(Resources.Fonts.gnuolane(size: 18))
                }
            }
            .ignoresSafeArea()
        }
        
        
    }
}
#if DEBUG
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
#endif
