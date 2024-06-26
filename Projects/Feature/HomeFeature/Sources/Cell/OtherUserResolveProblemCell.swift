import SwiftUI
import ViewUtil
import DesignSystem
import AnswersDomainInterface
import Kingfisher

public struct OtherUserResolveProblemCell: View {
    let id: String
    let userName: String
    let problem: String
    let chocies: [AnswerDetailEntity]
    @State var isOpen = false
    private let columns = [
        GridItem(.adaptive(minimum: 86)),
        GridItem(.adaptive(minimum: 86))
    ]

    public init(
        id: String,
        userName: String,
        problem: String,
        chocies: [AnswerDetailEntity]
    ) {
        self.id = id
        self.userName = userName
        self.problem = problem
        self.chocies = chocies
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            Text("@\(userName)")
                .nalagFont(12, weight: .pretendard(.medium))
                .padding(.bottom, 3)
            Text(problem)
                .nalagFont(16, weight: .pretendard(.semiBold))
            if isOpen {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                    ForEach(0..<chocies.count) { index in
                        VStack(alignment: .center, spacing: 10) {
                            KFImage(URL(string: chocies[index].photo))
                                .resizable()
                                .padding(.horizontal, 16)
                            Text("\(chocies[index].content)")
                                .nalagFont(16, weight: .tenadaFont, color: .Main.main70)
                        }
                        .padding(10)
                        .frame(minHeight: 86, maxHeight: 120)
                        .background(
                            chocies[index].isAnswer
                            ? Color.Main.main50
                            : Color.Main.main30
                        )
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
