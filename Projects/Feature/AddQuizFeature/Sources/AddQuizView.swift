import SwiftUI
import BaseFeature
import DesignSystem
import ViewUtil
import QuizResolveFeatureInterface
import ComposableArchitecture

public struct AddQuizView: View {
    typealias AddQuizAction = AddQuizStore.Action

    private let store: StoreOf<AddQuizStore>
    @ObservedObject private var viewStore: ViewStore<AddQuizStore.State, AddQuizAction.ViewAction>

    init(store: AddQuizStore) {
        self.store = Store(initialState: AddQuizStore.State()) {
            store
        }
        self.viewStore = ViewStore(self.store, observe: { $0 }, send: { .view($0) })
    }

    public var body: some View {
        Color.red
    }
}
