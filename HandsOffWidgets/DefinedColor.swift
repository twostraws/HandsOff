//
// DefinedColor.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import AppIntents
import SwiftUI

/// A simple mapping of selected SwiftUI colors to strings we can store.
enum DefinedColor: String, AppEnum {
    static let caseDisplayRepresentations: [DefinedColor: DisplayRepresentation] = [
        .black: "Black",
        .blue: "Blue",
        .green: "Green",
        .indigo: "Indigo",
        .mint: "Mint",
        .orange: "Orange",
        .purple: "Purple",
        .red: "Red",
        .teal: "Teal"
    ]

    /// All the SwiftUI colors that look good as background colors.
    case black, blue, green, indigo, mint, orange, purple, red, teal

    /// Map our preselected colors to the SwiftUI equivalents.
    var color: Color {
        switch self {
        case .black: .black
        case .blue: .blue
        case .green: .green
        case .indigo: .indigo
        case .mint: .mint
        case .orange: .orange
        case .purple: .purple
        case .red: .red
        case .teal: .teal
        }
    }

    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Color"
}
