//
//  GameView.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import SwiftUI

struct GameView: View {
    
    @Binding var lives: Int
    @Binding var satiety: Int

    var body: some View {
//        Ring()
//            .stroke(lineWidth: 3)
//            .foregroundColor(Resources.Colors.main)
        TimelineView(.periodic(from: .now, by: 0.005)) {timelineContext in
            AnimatedView(date: timelineContext.date, lives: $lives, satiety: $satiety)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(lives: .constant(2), satiety: .constant(2))
            .frame(maxWidth: .infinity, minHeight: 50, idealHeight: 100, maxHeight: 100, alignment: .center)
    }
}
