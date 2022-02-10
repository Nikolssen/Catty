//
//  AchievementView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/10/22.
//

import SwiftUI

struct AchievementView: View {
    let achievement: Achievement
    let isPosessed: Bool
    var body: some View {
        HStack {
            achievement.image
                .renderingMode(isPosessed ? .original : .template)
            VStack {
                Text(achievement.name)
                    .font(Resources.Fonts.molle(size: 24))
                Text(achievement.description)
                    .font(Resources.Fonts.molle(size: 18))
            }
        }
        .foregroundColor(isPosessed ? Resources.Colors.main : Color.gray)
        .padding()
        .background(GlassView())
        .clipShape(Capsule(style: .continuous))
        .padding(.horizontal, 10)
    }
}
