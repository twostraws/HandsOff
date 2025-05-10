//
//  HandsOffControlWidget.swift
//  HandsOff
//
//  Created by Ricky Witherspoon on 5/9/25.
//

import AppIntents
import SwiftUI
import WidgetKit

/// A control widget that displays a motivational message
/// and opens the app when tapped.
struct HandsOffControlWidget: ControlWidget {
    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: "HandsOffControlWidget",
            provider: HandsOffControlWidgetProvider()
        ) { message in
            ControlWidgetButton(action: OpenAppIntent()) {
                Label(message, systemImage: "hand.raised.fill")
            }
        }
        .promptsForUserConfiguration()
    }
}
