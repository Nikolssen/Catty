//
//  AchievementInfo.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/10/22.
//

import Foundation
import SwiftUI

struct Achievement {
    let image: Image
    let name: String
    let description: String
}

struct AchievementViewViewModel {
    let index: Int
    let achievement: Achievement
    let isPosessed: Bool
}
