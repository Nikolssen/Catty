//
//  AuthView.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        ZStack {
            Resources.Colors.background
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                Resources.Images.cat
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 30)
                
                VStack(alignment: .center, spacing: 10) {
                    AuthTextField(isSecure: false, text: $viewModel.username, placeholder: "E-mail")
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: "Password")
                }
                .padding(.horizontal)
                
                RedButton(text: Constants.loginTitle, action: { viewModel.loginSubject.send(Void()) })
                HStack {
                    Button(action: {}) {
                        Text(Constants.gameCenterTitle)
                            .foregroundColor(Resources.Colors.main)
                            .font(Resources.Fonts.molle(size: 18))
                            .frame(alignment: .leading)
                    }
                    Spacer()
                    Button(action: {}) {
                        Text(Constants.registerTitle)
                            .foregroundColor(Resources.Colors.main)
                            .font(Resources.Fonts.molle(size: 18))
                            .frame(alignment: .trailing)
                    }
                }
                .padding(.horizontal, 30)

            }
            .ignoresSafeArea()
        }
    }
    
    enum Constants {
        static let loginTitle: String = "Login"
        static let gameCenterTitle: String = "Login with Game Center"
        static let registerTitle: String = "Register"
    }
}
#if DEBUG
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: AuthViewModel())
    }
}
#endif
