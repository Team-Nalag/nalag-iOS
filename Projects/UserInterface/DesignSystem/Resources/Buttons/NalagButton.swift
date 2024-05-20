import SwiftUI
import ViewUtil

public struct NalagButton: View {
    let color: (back: Color, tint: Color)
    let text: String
    let action: () -> Void

    public init(color: (back: Color, tint: Color), text: String, action: @escaping () -> Void) {
        self.color = color
        self.text = text
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            VStack {
                Rectangle().frame(height: 0)
                Text(text)
                    .nalagFont(20, weight: .extraBold, color: color.tint)
            }
            .frame(height: 56)
            .background(color.back)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}
