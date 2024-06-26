import SwiftUI
import Kingfisher
import DesignSystem
import ComposableArchitecture
import Combine
import Foundation

struct QuizResolveView: View {
    @Environment(\.dismiss) private var dismiss
    typealias QuizResolveAction = QuizResolveStore.Action
    private let store: StoreOf<QuizResolveStore>
    @ObservedObject private var viewStore: ViewStore<QuizResolveStore.State, QuizResolveAction.ViewAction>
    private let columns = [
        GridItem(.adaptive(minimum: 160)),
        GridItem(.adaptive(minimum: 160))
    ]

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
                .onTapGesture {
                    viewStore.send(.quizStart, animation: .easeIn(duration: 0.5))
                }
            if viewStore.isOpen {
                Spacer().frame(width: 58)
                VStack(alignment: .center, spacing: 0) {
                    Rectangle().frame(height: 0)
                    VStack(spacing: 0) {
                        Rectangle().frame(height: 0)
                        Text(viewStore.title)
                            .nalagFont(20, weight: .tenadaFont, color: .white)
                            .padding(.vertical, 10)
                    }
                    .background(Color.Main.main50)
                    .clipCornerRadius(16)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                        ForEach(viewStore.choices, id: \.id) { data in
                            VStack(alignment: .center, spacing: 10) {
                                KFImage(URL(string: data.photo))
                                    .resizable()
                                    .padding(.horizontal, 16)
                                Text(data.content)
                                    .nalagFont(16, weight: .tenadaFont, color: .black)
                            }
                            .padding(10)
                            .frame(height: 125)
                            .background(viewStore.selectedCell == data.id ? Color.Main.main50 : Color.Main.main20)
                            .clipCornerRadius(8)
                            .onTapGesture {
                                viewStore.send(.answerClick(answerId: data.id))
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(18)
                .background(Color.white)
                .clipCornerRadius(32)
                .opacity(viewStore.opacity)
            }
            Spacer()
        }
        .onChange(of: viewStore.count) {
            if $0 == 5 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    dismiss()
                }
            }
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
