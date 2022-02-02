//
//  Ring.swift
//  Feed The Cat
//
//  Created on 2/2/22.
//

import Foundation
import SwiftUI

struct Ring: Shape {

    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
        }
    }
}
