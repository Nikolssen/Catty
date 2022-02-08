//
//  HUDView.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import SwiftUI

struct HUDView: View {
    let lives: Int
    let satiety: Int
    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: lives > 0 ? "heart.fill" : "heart")
                Image(systemName: lives > 1 ? "heart.fill" : "heart")
                Image(systemName: lives > 2 ? "heart.fill" : "heart")
            }
            Spacer()
            Text("Satiety: \(satiety)")
                .font(Resources.Fonts.molle(size: 24))
        }
        .foregroundColor(Resources.Colors.main)
    }
}

struct HUDView_Previews: PreviewProvider {
    static var previews: some View {
        HUDView(lives: 2, satiety: 12)
            .padding()
    }
}
