import SwiftUI
import BaseFeature
import DesignSystem
import ViewUtil
import QuizResolveFeatureInterface
import MakeQuizFeatureInterface
import ComposableArchitecture

public struct HomeView: View {
    typealias HomeAction = HomeStore.Action

    @AppState var appState

    private let quizResolveFactory: any QuizResolveFactory
    private let makeQuizFactory: any MakeQuizFactory

    private let store: StoreOf<HomeStore>
    @ObservedObject private var viewStore: ViewStore<HomeStore.State, HomeAction.ViewAction>

    init(store: HomeStore, quizResolveFactory: any QuizResolveFactory, makeQuizFactory: any MakeQuizFactory) {
        self.store = Store(initialState: HomeStore.State()) {
            store
        }
        self.viewStore = ViewStore(self.store, observe: { $0 }, send: { .view($0) })
        self.quizResolveFactory = quizResolveFactory
        self.makeQuizFactory = makeQuizFactory
    }

    public var body: some View {
        HStack(spacing: 35) {
            VStack(alignment: .leading) {
                NalagImage(.logo)
                    .frame(width: 168, height: 53)

                Spacer()

                VStack(spacing: 5) {
                    NalagButton(
                        color: (back: .Main.main50, tint: .white),
                        text: "퀴즈 풀기"
                    ) {
                        viewStore.send(.navigationToQuizResolve)
                    }

                    NalagButton(
                        color: (back: .Main.main80, tint: .white),
                        text: "퀴즈 만들기"
                    ) {
                        viewStore.send(.navigationToMakeQuiz)
                    }
                }
            }
            .frame(width: 274)

            VStack(alignment: .leading) {
                Rectangle().frame(height: 0)
                HStack {
                    Text("다른 유저가 푼 문제")
                        .nalagFont(20, weight: .tenadaFont, color: .Main.main80)
                        .padding(.bottom, 16)
                    Spacer()
                    Button {
                        viewStore.send(.viewAppear, animation: .easeIn)
                    } label: {
                        Image(systemName: "repeat.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(Color.black)
                    }
                }
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(viewStore.answers, id: \.id) { data in
                            OtherUserResolveProblemCell(
                                id: data.id,
                                userName: data.userName,
                                problem: data.title,
                                chocies: data.choices
                            )
                        }
                    }
                }
            }
            .padding(16)
            .background(Color.white)
            .clipCornerRadius(32)
        }
        .onAppear {
            viewStore.send(.viewAppear, animation: .easeIn)
        }
        .navigate(
            to: quizResolveFactory.makeView().eraseToAnyView(),
            when: viewStore.binding(
                get: { $0.isNavigateToQuizResolve },
                send: .popToQuizResolve
            )
        )
        .navigate(
            to: makeQuizFactory.makeView().eraseToAnyView(),
            when: viewStore.binding(
                get: { $0.isNavigateToMakeQuiz },
                send: .popToMakeQuiz
            )
        )
        .padding(16)
    }
}
