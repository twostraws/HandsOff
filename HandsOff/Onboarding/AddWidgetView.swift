import AVKit
import SwiftUI

struct AddWidgetView: View {
    let onComplete: () -> Void
    
    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    var body: some View {
        VStack(spacing: 24) {
            // Video demonstration
            videoPlayer
            
            informationContent
            
            Spacer()
            
            Button {
                onComplete()
            } label: {
                LongButtonLabel(text: "Got it!")
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
    
    // MARK: - UI Components
    
    private var videoPlayer: some View {
        VideoPlayerView(videoName: "hands-off-demo")
            .frame(height: 300)
            .clipShape(.rect(cornerRadius: 16))
            .padding([.top, .bottom])
    }
    
    private var informationContent: some View {
        VStack(spacing: 24) {
            Text("Adding Widget")
                .font(.title3)
                .bold()
                .foregroundStyle(.black)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 16) {
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
                .foregroundStyle(.white)
                .frame(width: 24, height: 24)
                .background(.blue, in: .circle)
            
            Text(text)
                .foregroundStyle(.black.opacity(0.7))
        }
    }
}

#Preview {
    AddWidgetView {
        print("Completing")
    }
    .background(Color.onboardingBg)
}
