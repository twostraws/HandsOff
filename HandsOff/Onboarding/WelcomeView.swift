import SwiftUI

struct WelcomeView: View {
    @State private var isAnimating = false
    @State private var pulseEffect = false
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
            LongButton.capsule("Continue", theme: .system) {
                onComplete()
            }
            .padding(.horizontal)
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.5).delay(0.7), value: isAnimating)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isAnimating = true
            }
        }
    }
    
    // MARK: - UI Components
    
    private var animatedAppIcon: some View {
        Image("AppIconImage")
            .resizable()
            .scaledToFit()
            .frame(width: 128)
            .clipShape(.circle)
            .padding(12)
            .foregroundStyle(.white)
            .overlay {
                Circle()
                    .fill(.clear)
                    .runningBorder(radius: 256, lineWidth: 2)
                    .blur(radius: 4)
            }
            .clipShape(.circle)
            .padding()
            .scaleEffect(isAnimating ? 1.0 : 0.8)
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(.spring(duration: 0.8), value: isAnimating)
            .onAppear {
                pulseEffect.toggle()
            }
    }
    
    private var informationContent: some View {
        VStack {
            Text("Hands Off!")
                .font(.title)
                .bold()
                .padding(.horizontal)
                .opacity(isAnimating ? 1.0 : 0.0)
                .offset(y: isAnimating ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.3), value: isAnimating)
            
            Text("Put down your phone and focus on what matters.")
                .font(.title3)
                .bold()
                .foregroundStyle(.secondary)
                .padding(.horizontal, 32)
                .opacity(isAnimating ? 1.0 : 0.0)
                .offset(y: isAnimating ? 0 : 15)
                .animation(.easeOut(duration: 0.6).delay(0.5), value: isAnimating)
        }
    }
}

#Preview {
    WelcomeView {
        print("Continuing")
    }
}
