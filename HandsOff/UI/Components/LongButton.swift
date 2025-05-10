// HandsOff: Design System
// github.com/Aayush9029

import SwiftUI

private struct AnyShape: Shape, @unchecked Sendable {
    private let makePath: @Sendable (CGRect) -> Path
    
    init<S: Shape>(_ shape: S) {
        self.makePath = { rect in
            shape.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        makePath(rect)
    }
}

public enum ButtonTheme {
    case light
    case dark
    case system
    case custom(background: Color, text: Color)
    
    func colors(in colorScheme: ColorScheme) -> (background: Color, text: Color) {
        switch self {
        case .light:
            return (.white, .black)
        case .dark:
            return (.black, .white)
        case .system:
            return colorScheme == .light ? (.black, .white) : (.white, .black)
        case .custom(let background, let text):
            return (background, text)
        }
    }
}

public enum ButtonShape {
    case rectangle(cornerRadius: CGFloat)
    case capsule
}

public struct LongButton: View {
    // Properties
    private let text: String
    private let symbol: String?
    private let theme: ButtonTheme
    private let shape: ButtonShape
    private let verticalPadding: CGFloat
    private let action: () -> Void
    
    // Environment
    @Environment(\.colorScheme) private var colorScheme
    
    // Main initializer
    public init(
        _ text: String,
        symbol: String? = nil,
        theme: ButtonTheme = .light,
        shape: ButtonShape = .rectangle(cornerRadius: 12),
        verticalPadding: CGFloat = 12,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.symbol = symbol
        self.theme = theme
        self.shape = shape
        self.verticalPadding = verticalPadding
        self.action = action
    }
    
    // Backward compatibility initializer
    public init(
        _ text: String,
        symbol: String? = nil,
        backgroundColor: Color = .white,
        textColor: Color = .black,
        cornerRadius: CGFloat = 12,
        verticalPadding: CGFloat = 12,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.symbol = symbol
        self.theme = .custom(background: backgroundColor, text: textColor)
        self.shape = .rectangle(cornerRadius: cornerRadius)
        self.verticalPadding = verticalPadding
        self.action = action
    }
    
    // Factory methods
    public static func light(
        _ text: String,
        symbol: String? = nil,
        shape: ButtonShape = .rectangle(cornerRadius: 12),
        verticalPadding: CGFloat = 12,
        action: @escaping () -> Void
    ) -> LongButton {
        LongButton(text, symbol: symbol, theme: .light, shape: shape, verticalPadding: verticalPadding, action: action)
    }
    
    public static func dark(
        _ text: String,
        symbol: String? = nil,
        shape: ButtonShape = .rectangle(cornerRadius: 12),
        verticalPadding: CGFloat = 12,
        action: @escaping () -> Void
    ) -> LongButton {
        LongButton(text, symbol: symbol, theme: .dark, shape: shape, verticalPadding: verticalPadding, action: action)
    }
    
    public static func system(
        _ text: String,
        symbol: String? = nil,
        shape: ButtonShape = .rectangle(cornerRadius: 12),
        verticalPadding: CGFloat = 12,
        action: @escaping () -> Void
    ) -> LongButton {
        LongButton(text, symbol: symbol, theme: .system, shape: shape, verticalPadding: verticalPadding, action: action)
    }
    
    public static func capsule(
        _ text: String,
        symbol: String? = nil,
        theme: ButtonTheme = .light,
        verticalPadding: CGFloat = 12,
        action: @escaping () -> Void
    ) -> LongButton {
        LongButton(text, symbol: symbol, theme: theme, shape: .capsule, verticalPadding: verticalPadding, action: action)
    }
    
    // View body
    public var body: some View {
        Button(action: action) {
            buttonContent
        }
    }
    
    // Helper views
    @ViewBuilder
    private var buttonContent: some View {
        let colors = theme.colors(in: colorScheme)
        
        Group {
            if let symbol {
                Label(text, systemImage: symbol)
            } else {
                Text(text)
            }
        }
        .foregroundColor(colors.text)
        .font(.title3.weight(.medium))
        .frame(maxWidth: .infinity)
        .padding(.vertical, verticalPadding)
        .background {
            buttonBackground(with: colors.background)
        }
        .contentShape(buttonBackgroundShape)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 6)
    }
    
    @ViewBuilder
    private func buttonBackground(with color: Color) -> some View {
        switch shape {
        case .rectangle(let cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color)
        case .capsule:
            Capsule()
                .fill(color)
        }
    }
    
    private var buttonBackgroundShape: AnyShape {
        switch shape {
        case .rectangle(let cornerRadius):
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
        case .capsule:
            return AnyShape(Capsule())
        }
    }
}

#if DEBUG
#Preview("Themes") {
    VStack(spacing: 20) {
        LongButton.light("Light Theme Button", symbol: "sun.max") {}
        LongButton.dark("Dark Theme Button", symbol: "moon.stars") {}
        LongButton.system("System Theme Button", symbol: "gear") {}
        LongButton("Custom", symbol: "paintpalette", theme: .custom(background: .blue, text: .white)) {}
    }
    .padding()
}

#Preview("Button Shapes") {
    VStack(spacing: 20) {
        LongButton("Default Rectangle", shape: .rectangle(cornerRadius: 12)) {}
        LongButton("Rounded Rectangle", shape: .rectangle(cornerRadius: 24)) {}
        LongButton.capsule("Capsule Light") {}
        LongButton.capsule("Capsule Dark", theme: .dark) {}
        LongButton.capsule("Capsule System", theme: .system) {}
    }
    .padding()
}

#Preview("System Theme in Dark Mode") {
    VStack(spacing: 20) {
        LongButton("System Button", theme: .system) {}
        LongButton.capsule("System Capsule", theme: .system) {}
    }
    .padding()
    .preferredColorScheme(.dark)
}
#endif
