//
//  WidgetMac.swift
//  WidgetMac
//
//  Created by Mike Chirico on 12/16/20.
//

import WidgetKit
import SwiftUI
import Intents


struct Counter {
    let txt: String
    var count: Int64
}
var c = Counter(txt: "b",count: 0)

struct Provider: IntentTimelineProvider {
    
   
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),txt:"s", configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),txt: "s", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            c.count += 1
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate,txt: "s \(c.count)", configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let txt: String
    let configuration: ConfigurationIntent
}

struct WidgetMacEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
        Text(entry.txt)
    }
}

@main
struct WidgetMac: Widget {
    let kind: String = "WidgetMac"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetMacEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetMac_Previews: PreviewProvider {
    static var previews: some View {
        WidgetMacEntryView(entry: SimpleEntry(date: Date(),txt: "s", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
