import NeedleFoundation
import ComposableArchitecture
import SwiftUI
import QuizResolveFeatureInterface

public protocol QuizResolveDependency: NeedleFoundation.Dependency {}

public final class QuizResolveComponent: Component<QuizResolveDependency>, QuizResolveFactory {
    public func makeView() -> some View {
        QuizResolveView(
            store: Store(initialState: QuizResolveStore.State()) {
                QuizResolveStore()
            }
        )
    }
}
