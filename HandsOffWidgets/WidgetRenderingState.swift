//
//  WidgetRenderingState.swift
//  HandsOffWidgetsExtension
//
//  Created by Maksym Horobets on 11.05.2025.
//

import WidgetKit

/// Represents the distinct rendering contexts or visual styles for a widget.
enum WidgetRenderingState {
    case homeScreen
    case homeScreenTinted
    case lockScreen
    case standby

    /// Determines the appropriate rendering state based on the widget's context.
    static func getState(
        _ widgetFamily: WidgetFamily,
        _ widgetRenderingMode: WidgetRenderingMode,
        _ showsWidgetContainerBackground: Bool
    ) -> Self {
        switch (widgetFamily, widgetRenderingMode, showsWidgetContainerBackground) {

        // Accessory/lockScreen rendering mode.
        case (.accessoryRectangular, _, _), (.accessoryInline, _, _):
            return .lockScreen

        // Accented/tinted rendering mode.
        case (_, .accented, _):
            return .homeScreenTinted

        // If not accented and the standard container background isn't shown (common in StandBy), use the standby state.
        case (_, _, false):
            return .standby

        // All other cases default to the standard Home Screen appearance.
        default:
            return .homeScreen
        }
    }
}
