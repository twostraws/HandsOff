//
// HandsOffApp.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import SwiftUI

@main
struct HandsOffApp: App {
    @AppStorage("onboardingComplete") private var onboardingComplete: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .light)
                .overlay {
                    if !onboardingComplete {
                        OnboardingView {
                            onboardingComplete = true
                        }
                        .transition(.opacity)
                        .environment(\.colorScheme, .light)
                    }
                }
        }
    }
}
