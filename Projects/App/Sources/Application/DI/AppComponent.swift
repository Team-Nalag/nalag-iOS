import NeedleFoundation
import AddQuizFeature
import AddQuizFeatureInterface
import SwiftUI
import RootFeature
import RootFeatureInterface
import HomeFeature
import HomeFeatureInterface
import SplashFeature
import SplashFeatureInterface
import QuizResolveFeature
import QuizResolveFeatureInterface

public final class AppComponent: BootstrapComponent {
//    private let _keychain: any Keychain
//
//    init(keychain: any Keychain) {
//        self._keychain = keychain
//    }

    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

//    public var keychain: any Keychain {
//        shared {
//            _keychain
//        }
//    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
}

public extension AppComponent {
    var homeFactory: any HomeFactory {
        HomeComponent(parent: self)
    }

    var splashFactory: any SplashFactory {
        SplashComponent(parent: self)
    }

    var quizResolveFactory: any QuizResolveFactory {
        QuizResolveComponent(parent: self)
    }

    var addQuizFactory: any AddQuizFactory {
        AddQuizComponent(parent: self)
    }
}
