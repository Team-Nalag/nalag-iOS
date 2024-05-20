import SwiftUI

public struct NalagFont: ViewModifier {
    public let size: CGFloat
    public var weight: NalagFontWeight
    private let lineHeight: CGFloat

    init(size: CGFloat, weight: NalagFontWeight) {
        self.size = size
        self.weight = weight
        self.lineHeight = weight.tenadaFont.font(size: size).lineHeight
    }

    public func body(content: Content) -> some View {
        content
            .font(weight.tenadaFont.swiftUIFont(size: size))
            .lineSpacing(lineHeight * 1.5 - lineHeight)
            .padding(.vertical, (lineHeight * 1.5 - lineHeight) / 2)
    }
}

public extension View {
    func nalagFont(_ size: CGFloat, weight: NalagFontWeight) -> some View {
        self
            .modifier(NalagFont(size: size, weight: weight))
    }

    func nalagFont(_ size: CGFloat, weight: NalagFontWeight, color: Color) -> some View {
        self
            .nalagFont(size, weight: weight)
            .foregroundColor(color)
    }
}
