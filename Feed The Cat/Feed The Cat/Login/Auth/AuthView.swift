//
//  AuthView.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel: AuthViewModel
    @EnvironmentObject var appState: AppState
    
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
                    AuthTextField(isSecure: false, text: $viewModel.email, placeholder: Constants.emailPlaceholder)
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: Constants.passwordPlaceholder)
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
                    Button(action: { appState.state = .registration }) {
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
        .onReceive(viewModel.$isAuthorized) {
            if $0 {
                appState.state = .tabBar
            }
        }
    }
    
    enum Constants {
        static let loginTitle: String = "Login"
        static let gameCenterTitle: String = "Login with Game Center"
        static let registerTitle: String = "Register"
        static let emailPlaceholder: String = "E-mail"
        static let passwordPlaceholder: String = "Password"
    }
}

