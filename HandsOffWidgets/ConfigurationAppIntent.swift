//
// ConfigurationAppIntent.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import AppIntents
import SwiftUI
import WidgetKit

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Configuration"

    /// One of the built-in messages they want to show.
    @Parameter(title: "Message", default: .putDownYourPhone)
    var message: DefinedMessage

    /// A custom message to show, when `message` is set to `.custom`
    @Parameter(title: "Custom Message", default: "")
    var userMessage: String

    /// The background color of this widget.
    @Parameter(title: "Background", default: .blue)
    var backgroundColor: DefinedColor

    /// Whether to add a white border around the edge.
    @Parameter(title: "Show Border", default: true)
    var showBorder: Bool

    /// Whether to apply a rounded font.
    @Parameter(title: "Rounded Text", default: false)
    var roundedText: Bool
}
