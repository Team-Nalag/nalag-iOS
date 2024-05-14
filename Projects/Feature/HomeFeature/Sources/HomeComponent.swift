import NeedleFoundation
import SwiftUI
import HomeFeatureInterface

public protocol HomeDependency: Dependency {}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        HomeView()
    }
}
