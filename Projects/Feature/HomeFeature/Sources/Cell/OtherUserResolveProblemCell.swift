import SwiftUI
import ViewUtil
import DesignSystem

public struct OtherUserResolveProblemCell: View {
    let id: String
    let problem: String
    @State var isOpen = false
    private let columns = [
        GridItem(.adaptive(minimum: 86)),
        GridItem(.adaptive(minimum: 86))
    ]

    public init(id: String, problem: String) {
        self.id = id
        self.problem = problem
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            Text(id)
                .nalagFont(12, weight: .pretendard(.medium))
                .padding(.bottom, 3)
            Text(problem)
                .nalagFont(16, weight: .pretendard(.semiBold))
            if isOpen {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                    ForEach(0..<4) { index in
                        VStack(alignment: .center, spacing: 0) {
                            NalagImage(.google)
                                .padding(.bottom, 10)
                            Text("\(index)")
                                .nalagFont(16, weight: .tenadaFont, color: .Main.main70)
                        }
                        .padding(10)
                        .frame(minHeight: 86)
                        .background(Color.Main.main30)
                        .clipCornerRadius(8)
                    }
                }
                .padding(.top, 10)
            }
        }
        .padding(16)
        .background(Color.Main.main10)
        .clipCornerRadius(16)
        .onTapGesture {
            withAnimation {
                isOpen.toggle()
            }
        }
    }
}
