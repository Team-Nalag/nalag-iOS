import NeedleFoundation
import SwiftUI
import SplashFeatureInterface
import ComposableArchitecture

public protocol SplashDependency: NeedleFoundation.Dependency {}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView(
            store: SplashStore()
        )
    }
}
