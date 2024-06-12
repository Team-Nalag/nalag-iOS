import SwiftUI
import BaseFeature
import DesignSystem
import ComposableArchitecture
import ViewUtil
import Combine

public struct SplashView: View {
    typealias SplashAction = SplashStore.Action
    @AppState var appState
    public var subscription = Set<AnyCancellable>()
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
                Link(destination: viewStore.githubOAuthUrl) {
                    HStack(spacing: 30) {
                        NalagImage(.google)
                            .frame(width: 24, height: 24)
                        Text("Use Github Account")
                            .nalagFont(14, weight: .pretendard(.semiBold), color: .gray)
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 70))
                    .background(Color.white)
                    .clipCornerRadius(8)
                }
            }
            Spacer()
       }
        .onAppear {
            self.viewStore.publisher
                .subscribe(on: RunLoop.main)
                .delay(for: .seconds(1), scheduler: RunLoop.main)
                .first()
                .sink(receiveValue: { _ in
                    viewStore.send(.viewAppear, animation: .easeIn)
                })
                .cancel()
        }
        .onChange(of: self.viewStore.appState) {
            self.appState.sceneFlow = $0
        }
        .onOpenURL(perform: { url in
            print(url.getAccessToken())
        })
    }
}

extension URL {
    func getAccessToken() -> String {
        let code = self.absoluteString.components(separatedBy: "code=").last ?? ""
        return code.components(separatedBy: "&state=").first ?? ""
    }
}
