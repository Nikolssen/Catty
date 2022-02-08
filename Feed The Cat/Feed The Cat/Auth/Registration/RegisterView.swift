//
//  RegisterView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel = .init()
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
                    AuthTextField(isSecure: false, text: $viewModel.username, placeholder: Constants.usernamePlaceholder)
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: Constants.passwordPlaceholder)
                }
                .padding(.horizontal)
                RedButton(text: Constants.registerTitle) { viewModel.registerSubject.send(Void())}
            }
            .ignoresSafeArea()
        }
    }
    
    enum Constants {
        static let usernamePlaceholder = "Username"
        static let passwordPlaceholder = "Password"
        static let registerTitle = "Register"
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: RegisterViewModel())
    }
}
