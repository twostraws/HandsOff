//
//  HandsOffConfigurationIntent.swift
//  HandsOff
//
//  Created by Ricky Witherspoon on 5/9/25.
//

import AppIntents

/// An intent used to configure the Hands Off Control Widget.
/// Allows users to select a predefined message or provide a custom one.
struct HandsOffControlConfigurationIntent: ControlConfigurationIntent {
    
    /// The display title for this configuration intent in the widget gallery.
    static let title: LocalizedStringResource = "Hands Off Widget Configuration"

    /// One of the predefined messages to display in the widget.
    @Parameter(
        title: "Message",
        default: .putDownYourPhone
    )
    var message: DefinedMessage

    /// A custom message to show when `message` is set to `.custom`.
    @Parameter(
        title: "Custom Message",
        default: ""
    )
    var userMessage: String
}
