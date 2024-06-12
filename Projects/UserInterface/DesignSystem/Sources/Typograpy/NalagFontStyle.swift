import SwiftUI

public enum NalagFontWeight {
    case tenadaFont
    case pretendard(PretendardFontWeight)

    var nalagFont: DesignSystemFontConvertible {
        switch self {
        case .tenadaFont:
            return DesignSystemFontFamily.Tenada.extraBold

        case let .pretendard(pretendardFontWeight):
            switch pretendardFontWeight {
            case .medium:
                return DesignSystemFontFamily.Pretendard.medium

            case .semiBold:
                return DesignSystemFontFamily.Pretendard.semiBold

            case .regular:
                return DesignSystemFontFamily.Pretendard.regular
            }
        }
    }
}

public enum PretendardFontWeight {
    case medium
    case semiBold
    case regular
}
