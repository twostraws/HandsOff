import SwiftUI

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
        .animation(.easeIn, value: currentStep)
        .transition(.opacity)
        .preferredColorScheme(currentStep == .welcomeView ? .dark : .light)
    }
}

#Preview {
    OnboardingView {}
}
