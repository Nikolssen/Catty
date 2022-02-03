//
//  GameView.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import SwiftUI

struct GameView: View {
    

    var models: [GameItem] = []
    var body: some View {
//        Ring()
//            .stroke(lineWidth: 3)
//            .foregroundColor(Resources.Colors.main)
        TimelineView(.periodic(from: .now, by: 0.5)) {timelineContext in
            Canvas { context, size in
                    let date = timelineContext.date
                    var currentPoint = CGPoint(x: 0, y: 0)
                    var image = context.resolve(Image(systemName: "clock"))
                    image.shading = .color(.green)

                    for i in 0..<20 {
                        var innerContext = context
                        innerContext.opacity = 0.1 * Double(i)
                        currentPoint.x += offsetFromDate(date: date)
                        currentPoint.y = 50
                        innerContext.draw(image, at: currentPoint)
                    }
//            GameItem.init(kind: .random, position: 1).image
//                .resizable()
//                .foregroundColor(.red)
//                .frame(width: 40, height: 40, alignment: .center)
            }
        }
    }
        private func offsetFromDate(date: Date) -> CGFloat {
            let seconds = CGFloat(Calendar.current.component(.second, from: date))
            print(seconds)
            return seconds * 5
        }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 100, maxHeight: 100, alignment: .center)
    }
}
