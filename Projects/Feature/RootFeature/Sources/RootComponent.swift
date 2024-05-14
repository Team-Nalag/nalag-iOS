import RootFeatureInterface
import HomeFeatureInterface
import SplashFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {
    var homeFactory: any HomeFactory { get }
    var splashFactory: any SplashFactory { get }
}

public final class RootComponent: Component<RootDependency>, RootFactory {
    public func makeView() -> some View {
        RootView(
            splashFactory: dependency.splashFactory,
            homeFactory: dependency.homeFactory
        )
    }
}
