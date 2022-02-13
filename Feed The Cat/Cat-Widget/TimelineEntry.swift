//
//  TimelineEntry.swift
//  Feed The Cat
//
//  Created by Ivan Budovich on 2/12/22.
//

import Foundation
import Intents
import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}
