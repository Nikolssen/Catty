//
//  ResultInfo.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/6/22.
//

import Foundation

struct ResultInfo {
    let date: Date
    let score: Int
    let player: String
}

struct ResultInfoViewModel {
    let date: String
    let score: String
    let player: String
    let index: Int
}
