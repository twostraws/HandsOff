import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // We might want to add control center demo video etc
    let videoName: String

    init(videoName: String = "hands-off-demo") {
        self.videoName = videoName
    }

    var body: some View {
        GeometryReader { geometry in
            if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
                let player = AVPlayer(url: url)
                VideoPlayer(player: player)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        player.play()
                    }

            } else {
                // Fallback if video is not found
                VStack {
                    Image(systemName: "video.slash.fill")
                        .font(.largeTitle)
                    Text("Video not found")
                        .font(.caption)
                }

                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.onboardingBg)
            }
        }
    }
}

#Preview {
    VideoPlayerView()
        .frame(height: 400)
}
