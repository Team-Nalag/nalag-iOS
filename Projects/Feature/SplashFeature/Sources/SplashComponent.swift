import NeedleFoundation
import SwiftUI
import SplashFeatureInterface

public protocol SplashDependency: Dependency {}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView()
    }
}
