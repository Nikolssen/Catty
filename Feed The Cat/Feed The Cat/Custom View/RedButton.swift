//
//  RedButton.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/8/22.
//

import SwiftUI

struct RedButton: View {
    let text: String
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(Resources.Fonts.molle(size: 24))
                .foregroundColor(Resources.Colors.background)
                .frame(minWidth: 30, maxWidth: .infinity, minHeight: 20, maxHeight: 50, alignment: .center)
        }
        .background(Resources.Colors.main)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: Resources.Colors.main.opacity(0.3), radius: 5, x: 5, y: 5)
        .padding(.horizontal, 30)
    }
}

struct RedButton_Previews: PreviewProvider {
    static var previews: some View {
        RedButton(text: "Feed", action: {})
    }
}
