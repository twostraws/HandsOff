//
//  WidgetRenderingState.swift
//  HandsOffWidgetsExtension
//
//  Created by Maksym Horobets on 11.05.2025.
//

import WidgetKit

enum WidgetRenderingState {
    case homeScreen
    case homeScreenTinted
    case lockScreen
    case standby
    
    static func getState(
      _ widgetFamily: WidgetFamily,
      _ widgetRenderingMode: WidgetRenderingMode,
      _ showsWidgetContainerBackground: Bool
    ) -> Self {
      switch (widgetFamily, widgetRenderingMode, showsWidgetContainerBackground) {
      // Accessory widgets always “accessory”
      case (.accessoryRectangular, _, _), (.accessoryInline, _, _):
        return .lockScreen

      // Tinted mode trumps the “no background” check
      case (_, .accented, _):
        return .homeScreenTinted

      // If rendering unaccented and no container — standby
      case (_, _, false):
        return .standby

      // Everything else is “homeScreen”
      default:
        return .homeScreen
      }
    }

}
