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
        .xSpacing(.center)
        .background(Color("onboarding-bg-color"))
        .animation(.easeIn, value: currentStep)
        .transition(.opacity)
        .preferredColorScheme(currentStep == .welcomeView ? .dark : .light)
    }
}

#Preview {
    OnboardingView {}
}
