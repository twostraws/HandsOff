//
//  OpenAppIntent.swift
//  HandsOff
//
//  Created by Ricky Witherspoon on 5/9/25.
//

import AppIntents

struct OpenAppIntent: AppIntent {
    static let title: LocalizedStringResource = "Open App"
    static let openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
