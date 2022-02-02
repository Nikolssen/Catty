//
//  Resources.swift
//  Feed The Cat
//
//  Created on 2/1/22.
//

import Foundation
import SwiftUI

enum Resources {
    enum Fonts {
        static func gnuolane(size: CGFloat) -> Font {
            Font.custom("Gnuolane", size: size)
    
        }
    }
    
    enum Images {
        static var cat = Image("cat")
        static var bottle = Image("bottle")
        static var milk = Image("milk")
        static var toxic = Image("toxic")
        static var burger = Image("burger")
    }
    
    enum Colors {
        static var main = Color("main", bundle: nil)
        static var background = Color("background", bundle: nil)
    }
}

