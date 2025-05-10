//
// HandsOffWidgetsBundle.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import SwiftUI
import WidgetKit

@main
struct HandsOffWidgetsBundle: WidgetBundle {
    var body: some Widget {
        HandsOffWidgets()
        HandsOffControlWidget()
    }
}
