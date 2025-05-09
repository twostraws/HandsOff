//
//  HandsOffControlWidget.swift
//  HandsOff
//
//  Created by Ricky Witherspoon on 5/9/25.
//

import SwiftUI
import WidgetKit

struct HandsOffControlWidget: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "HandsOffControlWidget",
        ) {
            ControlWidgetButton(action: OpenAppIntent()) {
                Label("Hands Off!", systemImage: "hand.raised.fill")
            }
        }
    }
}
