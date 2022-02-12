//
//  GlassView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/10/22.
//

import SwiftUI

struct GlassView: View {
    var body: some View {
            LinearGradient(colors: Constants.colors, startPoint: .top, endPoint: .bottom)
                .shadow(color: Resources.Colors.background, radius: Constants.shadowRadius, x: Constants.shadowOffset, y: Constants.shadowOffset)
    }
    
    private enum Constants {
        static let colors = [Resources.Colors.main.opacity(0.05), Color.white.opacity(0.5)]
        static let shadowRadius: CGFloat = 50
        static let shadowOffset: CGFloat = 20
    }
}
