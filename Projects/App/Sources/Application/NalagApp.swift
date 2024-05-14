import SwiftUI
import HomeFeature
import HomeFeatureInterface
import BaseFeature

@main
struct NalagApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }

}
