//
//  Cat_Widget.swift
//  Cat-Widget
//
//  Created by Ivan Budovich on 2/10/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Cat_WidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct Cat_Widget: Widget {
    let kind: String = "Cat_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Cat_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Cat_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Cat_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
