import SwiftUI

struct WelcomeView: View {
    let onComplete: () -> Void
    
    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // App icon with animated pulse effect
            animatedAppIcon
            
            // Title and description text
            informationContent
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // Continue button
            Button {
                onComplete()
            } label: {
                LongButtonLabel(text: "Continue")
            }
            .buttonStyle(.plain)
        }
    }
    
    // MARK: - UI Components
    
    private var animatedAppIcon: some View {
        Image("AppIconImage")
            .resizable()
            .scaledToFit()
            .frame(width: 128)
            .clipShape(.circle)
    }
    
    private var informationContent: some View {
        VStack {
            Text("Hands Off!")
                .font(.title)
                .bold()
                .padding(.horizontal)
            
            Text("Put down your phone and focus on what matters.")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.horizontal, 32)
        }
    }
}

#Preview {
    WelcomeView {
        print("Continuing")
    }
}
