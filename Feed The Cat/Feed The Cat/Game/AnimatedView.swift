//
//  AnimatedView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/4/22.
//

import SwiftUI

struct AnimatedView: View {
    let date: Date
    let state: GameState
    var body: some View {
        
        Canvas { context, size in
            for model in state.models {
                var image = context.resolve(model.image)
                if model.kind == .life {
                    image.shading = .color(Resources.Colors.main)
                }
                let currentPoint = CGPoint(x: size.width * model.position - 25, y: size.height / 2 - 25)
                context.draw(image, in: CGRect(origin: currentPoint, size:CGSize(width: 50, height: 50)), style: .init(eoFill: true, antialiased: true))
            }
            context.stroke(Path(ellipseIn: CGRect(x: size.width / 2 - 35, y: size.height / 2 - 35, width: 70, height: 70)), with: .color(Resources.Colors.main), lineWidth: 3)
        }
        .onChange(of: date) { date in
            state.update()
        }
    }
}
