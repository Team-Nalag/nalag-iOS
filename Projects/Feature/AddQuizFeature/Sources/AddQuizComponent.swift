import NeedleFoundation
import SwiftUI
import AddQuizFeatureInterface
public protocol AddQuizDependency: Dependency {}

public final class AddQuizComponent: Component<AddQuizDependency>, AddQuizFactory {
    public func makeView() -> some View {
        AddQuizView(
            store: AddQuizStore()
        )
    }
}
