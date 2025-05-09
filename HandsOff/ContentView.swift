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
        VStack {
            Spacer()

            Text("Hands Off!")
                .font(.largeTitle)
                .bold()

            Text("Put down your phone")
                .font(.title)
                .fontDesign(.rounded)
                .bold()

            Spacer()

            Text("""
            If you often pick up your phone with no intention other than mindless scrolling, this app is for you.
            """)
            .padding(.bottom, 20)

            Text("""
            Go back to your Home Screen then add a Hands Off widget there. \
            You can choose from various sizes, and once you've added a widget you can customize the message and style.
            """)

            Button("Need help adding a widget?", action: showHelp)
                .padding(.vertical)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundStyle(.blue)
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.mix(with: .black, by: 0.1).gradient)
        .foregroundStyle(.white)
        .statusBarHidden()
        .alert("Adding a widget", isPresented: $isShowingHelp) {
        } message: {
            Text("""
            Long-press on your Home Screen as if you wanted to rearrange your apps. \
            Tap the Edit button in the top corner, then select Add Widget, and scroll until you find Hands Off.\n\n
            If you want to edit a widget later on, long-press on it and choose Edit Widget.
            """)
        }
    }

    func showHelp() {
        isShowingHelp = true
    }
}

#Preview {
    ContentView()
}
