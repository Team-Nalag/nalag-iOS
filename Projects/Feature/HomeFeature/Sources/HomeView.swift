import SwiftUI
import BaseFeature
import DesignSystem

public struct HomeView: View {
    @AppState var appState
    public init() {}

    public var body: some View {
        HStack(spacing: 30) {
            VStack(alignment: .leading) {
                NalagImage(.logo)
                    .frame(width: 168, height: 53)
                Spacer()
                VStack(spacing: 5) {
                    NalagButton(
                        color: (back: .white, tint: .Main.main80),
                        text: "설정"
                    ) {}

                    NalagButton(
                        color: (back: .Main.main50, tint: .white),
                        text: "퀴즈 풀기"
                    ) {
                    }

                    NalagButton(
                        color: (back: .Main.main80, tint: .white),
                        text: "퀴즈 만들기"
                    ) {}
                }
            }
            .frame(width: 274)
            Spacer()
            Color.white
                .clipCornerRadius(32)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
    }
}
