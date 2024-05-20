import SwiftUI
import BaseFeature
import DesignSystem
import ComposableArchitecture
import ViewUtil

public struct SplashView: View {
    typealias SplashAction = SplashStore.Action
    @AppState var appState
    private let store: StoreOf<SplashStore>
    @ObservedObject private var viewStore: ViewStore<SplashStore.State, SplashAction.ViewAction>

    init(store: SplashStore) {
        self.store = Store(initialState: SplashStore.State()) {
            store
        }
        self.viewStore = ViewStore(self.store, observe: { $0 }, send: { .view($0) })
    }

    public var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .frame(height: 0)
            Spacer()
            NalagImage(.logo)
                .frame(width: 168, height: 53)
            if viewStore.isShowLoginButton {
                Button {
                    self.viewStore.send(.loginButtonDidTap)
                } label: {
                    HStack(spacing: 30) {
                        NalagImage(.google)
                            .frame(width: 24, height: 24)
                        Text("Use Google Account")
                            .nalagFont(14, weight: .extraBold, color: .gray)
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 70))
                    .background(Color.white)
                    .clipCornerRadius(8)
                }
            }
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.viewStore.send(.viewAppear, animation: .easeIn)
            }
        }
        .onChange(of: self.viewStore.appState) {
            self.appState.sceneFlow = $0
        }
    }
}
