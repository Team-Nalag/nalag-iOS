import NeedleFoundation
import SwiftUI
import SplashFeatureInterface
import UserDomainInterface

public protocol SplashDependency: Dependency {
    var generateTokenUseCase: any GenerateTokenUseCase { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView(
            store: SplashStore(generateTokenUseCase: dependency.generateTokenUseCase)
        )
    }
}
