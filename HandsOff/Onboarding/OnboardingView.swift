import Foundation
import SwiftUI

enum OnboardingStep: String {
    case welcomeView
    case addWidgetView
}

struct OnboardingView: View {
    @State private var currentStep: OnboardingStep = .welcomeView
    private let onComplete: () -> Void

    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }

    var body: some View {
        Group {
            switch currentStep {
            case .welcomeView:
                WelcomeView {
                    currentStep = .addWidgetView
                }
            case .addWidgetView:
                AddWidgetView {
                    onComplete()
                }
            }
        }
        .background(Color.onboardingBg)
        .foregroundStyle(.black) // Support for darkmode would be nice
        .animation(.easeIn, value: currentStep)
    }
}

#Preview {
    OnboardingView {}
}
