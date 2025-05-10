import AVKit
import SwiftUI

struct AddWidgetView: View {
    let onComplete: () -> Void
    
    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    var body: some View {
        VStack(spacing: 32) {
            // Video demonstration
            videoPlayer
            
            // Title and description text
            informationContent
                .multilineTextAlignment(.center)
            
            Spacer()
            
            // Continue button
            Button {
                onComplete()
            } label: {
                LongButtonLabel(text: "Got it!")
            }
            .buttonStyle(.plain)
        }
    }
    
    // MARK: - UI Components
    
    private var videoPlayer: some View {
        VideoPlayerView(videoName: "hands-off-demo")
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
    }
    
    private var informationContent: some View {
        VStack(spacing: 16) {
            Text("Adding a Widget")
                .font(.title)
                .bold()
                .foregroundStyle(.black)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 12) {
                instructionStep(number: "1", text: "Long-press on your Home Screen")
                instructionStep(number: "2", text: "Tap the + button in the top corner")
                instructionStep(number: "3", text: "Scroll and find Hands Off")
                instructionStep(number: "4", text: "Choose a widget size and add")
            }
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
