import RootFeatureInterface
import HomeFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {
    var homeFactory: any HomeFactory { get }
}

public final class RootComponent: Component<RootDependency>, RootFactory {
    public func makeView() -> some View {
        RootView()
    }
}
