import NeedleFoundation
import AnswersDomainInterface
import SwiftUI
import HomeFeatureInterface
import QuizResolveFeatureInterface
import MakeQuizFeatureInterface

public protocol HomeDependency: Dependency {
    var quizResolveFactory: any QuizResolveFactory { get }
    var makeQuizFactory: any MakeQuizFactory { get }
    var fetchAnswersUseCase: any FetchAnswersUseCase { get }
    var fetchAnswerDetailUseCase: any FetchAnswerDetailUseCase { get }
}

public final class HomeComponent: Component<HomeDependency>, HomeFactory {
    public func makeView() -> some View {
        HomeView(
            store: HomeStore(
                fetctAnswersUseCase: dependency.fetchAnswersUseCase,
                fetchAnswerDetailUseCase: dependency.fetchAnswerDetailUseCase
            ),
            quizResolveFactory: dependency.quizResolveFactory,
            makeQuizFactory: dependency.makeQuizFactory
        )
    }
}
