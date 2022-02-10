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
        static func molle(size: CGFloat) -> Font {
            Font.custom("Molle-Regular", size: size)
        }
    }
    
    enum Images {
        static var cat = Image("cat")
        static var bottle = Image("bottle")
        static var milk = Image("milk")
        static var toxic = Image("toxic")
        static var burger = Image("burger")
        static var fish = Image("fish")
        static var sausage = Image("sausage")
        static var molotov = Image("molotov")
        static var superCat = Image("supercat")
    }
    
    enum Colors {
        static var main = Color("main", bundle: nil)
        static var background = Color("background", bundle: nil)
    }
}

