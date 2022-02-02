//
//  GameView.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import SwiftUI

struct GameView: View {
    

   // var models: [Any]
    var body: some View {
        Ring()
            .stroke(lineWidth: 3)
            .foregroundColor(Resources.Colors.main)
        TimelineView(.periodic(from: .now, by: 0.01)) {context in
            EmptyView()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
