import SwiftUI
import HomeFeature
import HomeFeatureInterface
import BaseFeature
import DesignSystem

@main
struct NalagApp: App {
    @ObservedObject var appState = AppStateProvider(sceneFlow: .splash, rule: .student)

    init() {
        registerProviderFactories()
        DesignSystemFontFamily.registerAllCustomFonts()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                            .eraseToAnyView()
                            .environmentObject(appState)
        }
    }

}
