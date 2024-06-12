import SwiftUI
import DesignSystem
import ComposableArchitecture
import Combine
import Foundation

struct QuizResolveView: View {
    typealias QuizResolveAction = QuizResolveStore.Action
    private let store: StoreOf<QuizResolveStore>
    @ObservedObject private var viewStore: ViewStore<QuizResolveStore.State, QuizResolveAction.ViewAction>

    init(store: StoreOf<QuizResolveStore>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 }, send: { .view($0) })
    }
    var body: some View {
        HStack {
            Spacer()
            NalagImage(.mc)
                .frame(width: 220)
                .padding(.top, 30)
            VStack {
                Rectangle().frame(height: 0)
                Color.blue
            }
            Spacer()
        }
        .overlay(alignment: .topLeading) {
            Text("나락 퀴즈쇼")
                .nalagFont(36, weight: .tenadaFont, color: .white)
        }
        .padding(16)
        .background(Color.Main.main50)
        .navigationBarBackButtonHidden()
    }
}
