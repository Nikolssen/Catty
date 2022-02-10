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
                    Button(action: { withAnimation {
                        appState.flow = .authorization
                    } }) {
                        Text(Constants.loginTitle)
                            .foregroundColor(Resources.Colors.main)
                            .font(Resources.Fonts.molle(size: 18))
                            .frame(alignment: .trailing)
                    }
                    .buttonStyle(.plain)
                }
            }
            .ignoresSafeArea()
        }
        .alert(Constants.errorMessage, isPresented: $viewModel.showAlert, actions: {})
        .onReceive(viewModel.$isAuthorized) {
            if $0 {
                withAnimation {
                    appState.flow = .tabBar
                }
            }
        }
    
    }
    
    private enum Constants {
        static let usernamePlaceholder = "Username"
        static let passwordPlaceholder = "Password"
        static let registerTitle = "Register"
        static let loginTitle = "Login"
        static let errorMessage = "The error occured. Check your internet connection and input"
    }
}

