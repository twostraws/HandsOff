//
// ContentView.swift
// HandsOff
// https://www.github.com/twostraws/HandsOff
// See LICENSE for license information.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingHelp = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(.appIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)
                .clipShape(.circle)

            VStack {
                Text("Hands Off!")
                    .font(.title)
                    .bold()

                Text("Put down your phone")
                    .font(.title3)
                    .fontDesign(.rounded)
                    .foregroundStyle(.secondary)
                    .bold()
            }

            Spacer()

            Text("""
            If you often pick up your phone with no intention other than mindless scrolling, this app is for you.
            """)
            .padding(.bottom, 20)

            Text("""
            Go back to your Home Screen then add a Hands Off widget there. \
            You can choose from various sizes, and once you've added a widget you can customize the message and style.
            """)

            Button {
                isShowingHelp.toggle()
            } label: {
                LongButtonLabel(text: "Need help adding a widget?")
            }
            .padding(.top)
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.onboardingBg)
        .foregroundStyle(.black)
        .statusBarHidden()
        .sheet(isPresented: $isShowingHelp, content: {
            VStack {
                VideoPlayerView()
                Text("""
                Long-press on your Home Screen as if you wanted to rearrange your apps. \
                Tap the Edit button in the top corner, then select Add Widget, and scroll until you find Hands Off.\n\n
                If you want to edit a widget later on, long-press on it and choose Edit Widget.
                """)
                .padding()

                Button {
                    isShowingHelp.toggle()
                } label: {
                    LongButtonLabel(text: "Understood")
                }
                .buttonStyle(.plain)
                .padding()
            }
            .background(Color.onboardingBg)
        })
    }

    func showHelp() {
        isShowingHelp = true
    }
}

#Preview {
    ContentView()
}
