import SwiftUI

struct LongButtonLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(.title3.weight(.medium))
            .hSpacing(.center)
            .padding(.vertical, 12)
            .background(.black, in: .rect(cornerRadius: 12))
            .contentShape(.rect(cornerRadius: 12))
            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 6)
    }
}

#Preview {
    LongButtonLabel(text: "Continue")
}
