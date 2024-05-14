import SwiftUI
import BaseFeature
import HomeFeatureInterface
import SplashFeatureInterface
import ViewUtil

struct RootView: View {
    @AppState var appState
    private let splashFactory: any SplashFactory
    private let homeFactory: any HomeFactory

    public init(
        splashFactory: any SplashFactory,
        homeFactory: any HomeFactory
    ) {
        self.splashFactory = splashFactory
        self.homeFactory = homeFactory
    }

    var body: some View {
        NavigationView {
            ZStack {
                switch appState.sceneFlow {
                case .auth:
                    EmptyView().eraseToAnyView()
                        .environmentObject(appState)

                case .home:
                    homeFactory.makeView().eraseToAnyView()
                        .environmentObject(appState)

                case .splash:
                    splashFactory.makeView().eraseToAnyView()
                        .environmentObject(appState)
                }
            }
            .background(Color.white.ignoresSafeArea())
            .animation(.easeInOut, value: appState.sceneFlow)
            .transition(.opacity.animation(.easeInOut))
        }
    }
}
