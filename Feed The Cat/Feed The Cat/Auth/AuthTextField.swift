//
//  AuthTextField.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import SwiftUI

struct AuthTextField: View {
    
    let isSecure: Bool
    @Binding var text: String
    let placeholder: LocalizedStringKey
    var body: some View {
        HStack {
            Image(systemName: isSecure ? "lock" : "person")
                .font(.system(size: 26).bold())
                .foregroundColor(Resources.Colors.main)
            PackedTextField(text: $text, placeholder: placeholder, isSecure: isSecure)
                .foregroundColor(Resources.Colors.main)
                .font(Resources.Fonts.gnuolane(size: 26))
                .accentColor(Resources.Colors.main)
        }
        .padding()
        .background(Color.white)
        
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding()
        
        
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            AuthTextField(isSecure: false, text: .constant(""), placeholder: "Username")
            
            AuthTextField(isSecure: true, text: .constant(""), placeholder: "Password")
            
        }
        
        
    }
}


struct PackedTextField: View {
    @Binding var text: String
    var placeholder: LocalizedStringKey
    let isSecure: Bool
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text, prompt: Text(placeholder))
        }
        else {
            TextField(placeholder, text: $text, prompt: Text(placeholder))
        }
    }
}
