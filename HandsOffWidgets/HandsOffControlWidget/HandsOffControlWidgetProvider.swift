//
//  HandsOffControlWidgetProvider.swift
//  HandsOff
//
//  Created by Ricky Witherspoon on 5/9/25.
//

import AppIntents
import WidgetKit

/// Provides the dynamic message text for the Hands Off Control Widget.
struct HandsOffControlWidgetProvider: AppIntentControlValueProvider {

    /// Returns a placeholder value to be shown in widget previews.
    func previewValue(configuration: HandsOffControlConfigurationIntent) -> String {
        "Put down your phone."
    }

    /// Returns the current value to display in the widget,
    /// based on the selected or custom message.
    func currentValue(configuration: HandsOffControlConfigurationIntent) async throws -> String {
        switch configuration.message {
        case .custom:
            let resource = LocalizedStringResource(stringLiteral: configuration.userMessage)
            return resource.key
        default:
            if let text = DefinedMessage.caseDisplayRepresentations[configuration.message] {
                return text.title.key
            } else {
                return "Put down your phone."
            }
        }
    }
}
