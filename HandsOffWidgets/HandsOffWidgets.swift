//
// HandsOffWidgets.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import SwiftUI
import WidgetKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> HandsOffEntry {
        HandsOffEntry(date: .now, configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> HandsOffEntry {
        HandsOffEntry(date: .now, configuration: configuration)
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<HandsOffEntry> {
        let entries = [HandsOffEntry(date: .now, configuration: configuration)]
        return Timeline(entries: entries, policy: .never)
    }
}

struct HandsOffEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct HandsOffWidgetEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.widgetRenderingMode) var widgetRenderingMode

    /// Used to detect if the widget is in being shown in StandbyMode
    @Environment(\.showsWidgetContainerBackground) private var showsWidgetContainerBackground

    var entry: Provider.Entry

    /// The text to render in this widget, which might be a defined message or
    /// something the user entered by hand.
    var message: LocalizedStringResource {
        if entry.configuration.message == .custom {
            LocalizedStringResource(stringLiteral: entry.configuration.userMessage)
        } else {
            if let text = DefinedMessage.caseDisplayRepresentations[entry.configuration.message] {
                text.title
            } else {
                "Put down your phone."
            }
        }
    }
    
    var widgetRenderingState: WidgetRenderingState {
        .getState(widgetFamily, widgetRenderingMode, showsWidgetContainerBackground)
    }

    var body: some View {
        switch widgetRenderingState {
        case .lockScreen:
            lockScreenView
        case .homeScreen:
            baseHomeScreenView
                .background(entry.configuration.backgroundColor.color.gradient)
        case .homeScreenTinted:
            baseHomeScreenView
                .background(Color.clear.gradient)
        case .standby:
            standbyView
        }
    }

    private var baseText: some View {
        Text(message)
            .multilineTextAlignment(.center)
            .font(.system(size: 144)) // Use a massive font…
            .minimumScaleFactor(0.05) // …but be prepared to scale it right down.
            .fontWeight(.black)
            .fontDesign(entry.configuration.roundedText ? .rounded : .default)
    }
    
    private var standbyView: some View {
        baseText
            .foregroundStyle(entry.configuration.backgroundColor.color.gradient)
    }
    
    private var baseHomeScreenView: some View {
        baseText
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .foregroundStyle(Color.white)
            .overlay {
                if entry.configuration.showBorder {
                    ContainerRelativeShape()
                        .stroke(.white, lineWidth: 12)
                }
            }
            .widgetAccentable()
    }
    
    private var lockScreenView: some View {
        baseText
            .foregroundStyle(Color.primary)
            .padding(5)
    }
}

struct HandsOffWidgets: Widget {
    let kind: String = "HandsOffWidgets"

    /// Creates a configuration that supports most widget sizes, going edge to edge,
    /// and prompts the user to configure the widget immediately.
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            HandsOffWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([
            .systemSmall,
            .systemMedium,
            .systemLarge,
            .systemExtraLarge,
            .accessoryRectangular,
            .accessoryInline
        ])
        .contentMarginsDisabled()
        .promptsForUserConfiguration()
    }
}

#Preview(as: .systemSmall) {
    HandsOffWidgets()
} timeline: {
    HandsOffEntry(date: .now, configuration: ConfigurationAppIntent())
}

#Preview(as: .systemMedium) {
    HandsOffWidgets()
} timeline: {
    HandsOffEntry(date: .now, configuration: ConfigurationAppIntent())
}

#Preview(as: .systemLarge) {
    HandsOffWidgets()
} timeline: {
    HandsOffEntry(date: .now, configuration: ConfigurationAppIntent())
}

#Preview(as: .accessoryRectangular) {
    HandsOffWidgets()
} timeline: {
    HandsOffEntry(date: .now, configuration: ConfigurationAppIntent())
}
