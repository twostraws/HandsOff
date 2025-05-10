import AVKit
import SwiftUI

struct AddWidgetView: View {
    @State private var isAnimating = false
    let onComplete: () -> Void
    
    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            
            // Video demonstration
            videoPlayer
            
            // Title and description text
            informationContent
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // Continue button
            LongButton.capsule("Got it!", theme: .custom(background: .blue, text: .white)) {
                onComplete()
            }
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.5).delay(0.7), value: isAnimating)
            .padding(.horizontal)
        }
        .background(Color.white)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isAnimating = true
            }
        }
    }
    
    // MARK: - UI Components
    
    private var videoPlayer: some View {
        VideoPlayerView(videoName: "hands-off-demo")
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
            .scaleEffect(isAnimating ? 1.0 : 0.8)
            .opacity(isAnimating ? 1.0 : 0.0)
            .animation(.spring(duration: 0.8), value: isAnimating)
    }
    
    private var informationContent: some View {
        VStack(spacing: 16) {
            Text("Adding a Widget")
                .font(.title)
                .bold()
                .foregroundStyle(.black)
                .padding(.horizontal)
                .opacity(isAnimating ? 1.0 : 0.0)
                .offset(y: isAnimating ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.3), value: isAnimating)
            
            VStack(alignment: .leading, spacing: 12) {
                instructionStep(number: "1", text: "Long-press on your Home Screen")
                instructionStep(number: "2", text: "Tap the + button in the top corner")
                instructionStep(number: "3", text: "Scroll and find Hands Off")
                instructionStep(number: "4", text: "Choose a widget size and add")
            }
            .padding(.horizontal, 32)
            .opacity(isAnimating ? 1.0 : 0.0)
            .offset(y: isAnimating ? 0 : 15)
            .animation(.easeOut(duration: 0.6).delay(0.5), value: isAnimating)
        }
    }
    
    private func instructionStep(number: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(number)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 28, height: 28)
                .background(Circle().fill(.blue))
            
            Text(text)
                .font(.body)
                .foregroundStyle(.black.opacity(0.7))
        }
    }
}

#Preview {
    AddWidgetView {
        print("Completing")
    }
}
