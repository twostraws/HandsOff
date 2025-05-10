// HandsOff: Design System
// github.com/Aayush9029

import SwiftUI

/// Custom View Extensions
public extension View {
    /// Custom Spacers
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }

    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }

    @ViewBuilder
    func xSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

public extension View {
    func animatedAppearance(delay: Double = 0) -> some View {
        self
            .opacity(0)
            .offset(y: 20)
            .onAppear {
                withAnimation(.easeOut(duration: 0.6).delay(delay)) {
                    _ = self
                        .opacity(1)
                        .offset(y: 0)
                }
            }
    }
}
