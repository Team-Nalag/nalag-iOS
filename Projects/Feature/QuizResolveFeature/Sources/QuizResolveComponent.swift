import NeedleFoundation
import ComposableArchitecture
import SwiftUI
import QuizResolveFeatureInterface
import QuizzesDomainInterface
import AnswersDomainInterface

public protocol QuizResolveDependency: NeedleFoundation.Dependency {
    var fetchQuizzesUseCase: any FetchQuizzesUseCase { get }
    var postAnswerUseCase: any PostAnswerUseCase { get }
}

public final class QuizResolveComponent: Component<QuizResolveDependency>, QuizResolveFactory {
    public func makeView() -> some View {
        QuizResolveView(
            store: Store(initialState: QuizResolveStore.State()) {
                QuizResolveStore(
                    fetchQuizzesUseCase: dependency.fetchQuizzesUseCase,
                    postAnswerUseCase: dependency.postAnswerUseCase
                )
            }
        )
    }
}
