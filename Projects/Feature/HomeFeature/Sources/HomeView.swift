import SwiftUI
import BaseFeature
import DesignSystem
import ViewUtil
import QuizResolveFeatureInterface
import ComposableArchitecture

public struct HomeView: View {
    typealias HomeAction = HomeStore.Action

    @AppState var appState
    @State var isOpen: Bool = false

    private let quizResolveFactory: any QuizResolveFactory

    private let store: StoreOf<HomeStore>
    @ObservedObject private var viewStore: ViewStore<HomeStore.State, HomeAction.ViewAction>

    init(store: HomeStore, quizResolveFactory: any QuizResolveFactory) {
        self.store = Store(initialState: HomeStore.State()) {
            store
        }
        self.viewStore = ViewStore(self.store, observe: { $0 }, send: { .view($0) })
        self.quizResolveFactory = quizResolveFactory
    }

    public var body: some View {
        HStack(spacing: 35) {
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
                        viewStore.send(.navigationToQuizResolve)
                    }

                    NalagButton(
                        color: (back: .Main.main80, tint: .white),
                        text: "퀴즈 만들기"
                    ) {}
                }
            }
            .frame(width: 274)
            if isOpen {
                VStack(alignment: .leading) {
                    Rectangle().frame(height: 0)
                    Text("다른 유저가 푼 문제")
                        .nalagFont(20, weight: .tenadaFont, color: .Main.main80)
                        .padding(.bottom, 16)
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(0..<10) { _ in
                                OtherUserResolveProblemCell(
                                    id: "@juyeong525",
                                    problem: "asdjfkasldfalsnfjnasdnjfladj"
                                )
                            }
                        }
                    }
                }
                .padding(16)
                .background(Color.white)
                .clipCornerRadius(32)
            } else {
                Spacer()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                withAnimation(.easeIn(duration: 0.5)) {
                    isOpen = true
                }
            }
        }
        .onDisappear {
            isOpen = false
        }
        .navigate(
            to: quizResolveFactory.makeView().eraseToAnyView(),
            when: viewStore.binding(
                get: { $0.isNavigateToQuizResolve },
                send: .popToQuizResolve
            )
        )
        .padding(16)
    }
}
