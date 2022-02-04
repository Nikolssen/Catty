//
//  AnimatedView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/4/22.
//

import SwiftUI

struct AnimatedView: View {
    let date: Date
    @Binding var lives: Int
    @Binding var satiety: Int
    @State var models: [GameItem] = []
    var body: some View {
        
        Canvas { context, size in
            for model in models {
                var image = context.resolve( model.image)
                if model.kind == .life {
                    image.shading = .color(Resources.Colors.main)
                }
                let currentPoint = CGPoint(x: size.width * model.position, y: 0)
                context.draw(image, in: CGRect(origin: currentPoint, size:CGSize(width: 50, height: 50)), style: .init(eoFill: true, antialiased: true))
            }
        }
        .onChange(of: date) { date in
            for (index, _) in models.enumerated() {
                models[index].position -= 0.005
            }
            
            if let first = models.first?.position, first <= 0.00 {
                _ = models.removeFirst()
            }
            if let last = models.last?.position, last <= 0.71 {
                models.append(GameItem.random)
            }
            if models.isEmpty {
                models.append(GameItem.random)
            }
        }
    }
}
