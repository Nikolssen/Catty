//
//  RegisterView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/3/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel
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
                
                Button(action: {}) {
                    Text(Constants.registerTitle)
                        .font(Resources.Fonts.gnuolane(size: 24))
                        .foregroundColor(Resources.Colors.background)
                        .frame(minWidth: 30, maxWidth: .infinity, minHeight: 20, maxHeight: 50, alignment: .center)
                        .background(Resources.Colors.main)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding(.horizontal, 30)
                        .shadow(color: Resources.Colors.main.opacity(0.3), radius: 5, x: 5, y: 5)
                }
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
