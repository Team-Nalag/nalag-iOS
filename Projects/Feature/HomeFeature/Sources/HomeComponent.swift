import NeedleFoundation
import SwiftUI
import HomeFeatureInterface
import QuizResolveFeatureInterface

public protocol HomeDependency: Dependency {
    var quizResolveFactory: any QuizResolveFactory { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        HomeView(
            store: HomeStore(),
            quizResolveFactory: dependency.quizResolveFactory
        )
    }
}
