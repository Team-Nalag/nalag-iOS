import NeedleFoundation
import BaseDomain
import BaseDomainInterface
import Moya
import JwtStore
import JwtStoreInterface
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
import MakeQuizFeature
import MakeQuizFeatureInterface

public final class AppComponent: BootstrapComponent {
    
    public func makeRootView() -> some View {
        rootComponent.makeView()
    }
    
    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
    
    var jwtStore: any JwtStore {
        shared {
            JwtStoreImpl()
        }
    }

    var networking: any Networking {
        shared {
            NetworkingImpl(jwtStore: jwtStore)
        }
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

    var makeQuizFactory: any MakeQuizFactory {
        MakeQuizComponent(parent: self)
    }
}
