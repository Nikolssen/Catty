//
//  RegisterView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel: RegisterViewModel
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
                    AuthTextField(isSecure: false, text: $viewModel.email, placeholder: Constants.usernamePlaceholder)
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: Constants.passwordPlaceholder)
                }
                .padding(.horizontal)
                VStack {
                    RedButton(text: Constants.registerTitle) { viewModel.registerSubject.send(Void())}
                    Button(action: { appState.flow = .authorization }) {
                        Text(Constants.loginTitle)
                            .foregroundColor(Resources.Colors.main)
                            .font(Resources.Fonts.molle(size: 18))
                            .frame(alignment: .trailing)
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onReceive(viewModel.$isAuthorized) {
            if $0 {
                appState.flow = .tabBar
            }
        }
    
    }
    
    private enum Constants {
        static let usernamePlaceholder = "Username"
        static let passwordPlaceholder = "Password"
        static let registerTitle = "Register"
        static let loginTitle = "Login"
    }
}

