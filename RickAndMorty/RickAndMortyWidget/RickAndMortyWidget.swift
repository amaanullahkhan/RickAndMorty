//
//  RickAndMortyWidget.swift
//  RickAndMortyWidget
//
//  Created by Amaan Ullah on 21/11/2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: .now, character: .rick)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: .now, character: .rick)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        entries.append(SimpleEntry(date: .now, character: .rick))
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let character: Character
}

struct RickAndMortyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CharacterView(viewModel: RMCharacterViewModel(character: entry.character))
    }
}

struct RickAndMortyWidget: Widget {
    let kind: String = "RickAndMortyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                RickAndMortyWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                RickAndMortyWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Rick and Morty Detail")
        .description("Show your last visited character")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    RickAndMortyWidget()
} timeline: {
    SimpleEntry(date: .now, character: .rick)
    SimpleEntry(date: .now, character: .morty)
}

extension Character {
    static let rick = Character(name: "Rick Sanchez",
                                image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                                species: "Human", status: .alive, gender: .male, location: .init(name: "Earth"))
    static let morty = Character(name: "Morty Smith",
                                image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
                                species: "Human", status: .alive, gender: .male, location: .init(name: "Earth"))
}
