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
                    AuthTextField(isSecure: false, text: $viewModel.username, placeholder: "Username")
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: "Password")
                }
                .padding(.horizontal)
                
                Button(action: {}) {
                    Text("Login")
                        .font(Resources.Fonts.molle(size: 24))
                        .foregroundColor(Resources.Colors.background)
                        .frame(minWidth: 30, maxWidth: .infinity, minHeight: 20, maxHeight: 50, alignment: .center)
                        .background(Resources.Colors.main)
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding(.horizontal, 30)
                        .shadow(color: Resources.Colors.main.opacity(0.3), radius: 5, x: 5, y: 5)
                }
                HStack {
                    Button(action: {}) {
                        Text("Login with Game Center")
                            .foregroundColor(Resources.Colors.main)
                            .font(Resources.Fonts.molle(size: 18))
                            .frame(alignment: .leading)
                    }
                    Spacer()
                    Button(action: {}) {
                        Text("Register")
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
}
#if DEBUG
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: AuthViewModel())
    }
}
#endif
