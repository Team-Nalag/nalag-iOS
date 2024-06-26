import NeedleFoundation
import QuizzesDomainInterface
import ComposableArchitecture
import SwiftUI
import MakeQuizFeatureInterface

public protocol MakeQuizDependency: NeedleFoundation.Dependency {
    var postQuizUseCase: any PostQuizUseCase { get }
    var imageUploadUseCase: any ImageUploadUseCase { get }
}

public final class MakeQuizComponent: Component<MakeQuizDependency>, MakeQuizFactory {
    public func makeView() -> some View {
        MakeQuizView(
            store: Store(initialState: MakeQuizStore.State()) {
                MakeQuizStore(
                    postQuizUseCase: dependency.postQuizUseCase,
                    imageUploadUseCase: dependency.imageUploadUseCase
                )
            }
        )
    }
}
