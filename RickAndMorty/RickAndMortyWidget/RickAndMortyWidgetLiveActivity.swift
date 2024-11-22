//
//  RickAndMortyWidgetLiveActivity.swift
//  RickAndMortyWidget
//
//  Created by Amaan Ullah on 21/11/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RickAndMortyWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RickAndMortyWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RickAndMortyWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension RickAndMortyWidgetAttributes {
    fileprivate static var preview: RickAndMortyWidgetAttributes {
        RickAndMortyWidgetAttributes(name: "World")
    }
}

extension RickAndMortyWidgetAttributes.ContentState {
    fileprivate static var smiley: RickAndMortyWidgetAttributes.ContentState {
        RickAndMortyWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RickAndMortyWidgetAttributes.ContentState {
         RickAndMortyWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RickAndMortyWidgetAttributes.preview) {
   RickAndMortyWidgetLiveActivity()
} contentStates: {
    RickAndMortyWidgetAttributes.ContentState.smiley
    RickAndMortyWidgetAttributes.ContentState.starEyes
}
