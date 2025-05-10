import SwiftUI

struct RunningBorder: ViewModifier {
    @State private var rotation = 0.0
    let radius: CGFloat
    let lineWidth: CGFloat
    let animated: Bool
    let duration: TimeInterval
    let colors: [Color]

    init(
        radius: CGFloat,
        lineWidth: CGFloat,
        animated: Bool,
        duration: TimeInterval,
        colors: [Color]
    ) {
        self.radius = radius
        self.lineWidth = lineWidth
        self.animated = animated
        self.duration = duration
        self.colors = colors
    }

    func body(content: Content) -> some View {
        if animated {
            content
                .overlay(
                    RoundedRectangle(cornerRadius: radius)
                        .strokeBorder(
                            AngularGradient(
                                gradient: Gradient(
                                    colors: colors
                                ),
                                center: .center,
                                startAngle: .degrees(rotation),
                                endAngle: .degrees(rotation + 360)
                            ).opacity(0.5),
                            lineWidth: lineWidth
                        )
                        .drawingGroup()
                )
                .onAppear {
                    withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
        } else {
            content
        }
    }
}

public extension View {
    func runningBorder(
        radius: CGFloat = 32,
        lineWidth: CGFloat = 4,
        animated: Bool = true,
        duration: TimeInterval = 2,
        colors: [Color] = Color.defaultColorArray

    ) -> some View {
        modifier(
            RunningBorder(
                radius: radius,
                lineWidth: lineWidth,
                animated: animated,
                duration: duration,
                colors: colors
            )
        )
    }
}

public extension Color {
    static let defaultColorArray: [Color] = [
        .indigo,
        .blue,
        .red,
        .orange,
        .indigo
    ]
}

#if DEBUG
#Preview {
    Rectangle()
        .fill(.clear)
        .runningBorder()
        .padding()
}
#endif