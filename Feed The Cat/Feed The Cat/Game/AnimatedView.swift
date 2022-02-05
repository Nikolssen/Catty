//
//  AnimatedView.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/4/22.
//

import SwiftUI

struct AnimatedView: View {
    let date: Date
    @Binding var models: [GameItem]
    var body: some View {
        
        Canvas { context, size in
            for model in models {
                var image = context.resolve( model.image)
                if model.kind == .life {
                    image.shading = .color(Resources.Colors.main)
                }
                let currentPoint = CGPoint(x: size.width * model.position, y: size.height / 2 - 20)
                context.draw(image, in: CGRect(origin: currentPoint, size:CGSize(width: 40, height: 40)), style: .init(eoFill: true, antialiased: true))
            }
            context.stroke(Path(ellipseIn: CGRect(x: size.width / 2 - 25, y: size.height / 2 - 25, width: 50, height: 50)), with: .color(Resources.Colors.main), lineWidth: 3)
        }
        .onChange(of: date) { date in
            for index in 0..<models.count {
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
