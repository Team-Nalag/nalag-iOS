

import AddQuizFeature
import AddQuizFeatureInterface
import AnswersDomain
import AnswersDomainInterface
import BaseDomain
import BaseDomainInterface
import ComposableArchitecture
import Foundation
import HomeFeature
import HomeFeatureInterface
import JwtStore
import JwtStoreInterface
import MakeQuizFeature
import MakeQuizFeatureInterface
import Moya
import NeedleFoundation
import QuizResolveFeature
import QuizResolveFeatureInterface
import QuizzesDomain
import QuizzesDomainInterface
import RootFeature
import RootFeatureInterface
import SplashFeature
import SplashFeatureInterface
import SwiftUI
import UserDomain
import UserDomainInterface

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class AddQuizDependency388662d86ab8b8bf6a49Provider: AddQuizDependency {


    init() {

    }
}
/// ^->AppComponent->AddQuizComponent
private func factory5a83d66bace252942438e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AddQuizDependency388662d86ab8b8bf6a49Provider()
}
private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var generateTokenUseCase: any GenerateTokenUseCase {
        return appComponent.generateTokenUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}
private class QuizResolveDependency674e916aed3006babd96Provider: QuizResolveDependency {
    var fetchQuizzesUseCase: any FetchQuizzesUseCase {
        return appComponent.fetchQuizzesUseCase
    }
    var postAnswerUseCase: any PostAnswerUseCase {
        return appComponent.postAnswerUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->QuizResolveComponent
private func factorye2552b98a0872927f159f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return QuizResolveDependency674e916aed3006babd96Provider(appComponent: parent1(component) as! AppComponent)
}
private class MakeQuizDependency01474ad39cbbe44573e0Provider: MakeQuizDependency {
    var postQuizUseCase: any PostQuizUseCase {
        return appComponent.postQuizUseCase
    }
    var imageUploadUseCase: any ImageUploadUseCase {
        return appComponent.imageUploadUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MakeQuizComponent
private func factoryda695f07f9f90d1e0808f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MakeQuizDependency01474ad39cbbe44573e0Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var homeFactory: any HomeFactory {
        return appComponent.homeFactory
    }
    var splashFactory: any SplashFactory {
        return appComponent.splashFactory
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {
    var quizResolveFactory: any QuizResolveFactory {
        return appComponent.quizResolveFactory
    }
    var makeQuizFactory: any MakeQuizFactory {
        return appComponent.makeQuizFactory
    }
    var fetchAnswersUseCase: any FetchAnswersUseCase {
        return appComponent.fetchAnswersUseCase
    }
    var fetchAnswerDetailUseCase: any FetchAnswerDetailUseCase {
        return appComponent.fetchAnswerDetailUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["remoteUserDataSource-any RemoteUserDataSource"] = { [unowned self] in self.remoteUserDataSource as Any }
        localTable["userRepository-any UserRepository"] = { [unowned self] in self.userRepository as Any }
        localTable["generateTokenUseCase-any GenerateTokenUseCase"] = { [unowned self] in self.generateTokenUseCase as Any }
        localTable["homeFactory-any HomeFactory"] = { [unowned self] in self.homeFactory as Any }
        localTable["splashFactory-any SplashFactory"] = { [unowned self] in self.splashFactory as Any }
        localTable["quizResolveFactory-any QuizResolveFactory"] = { [unowned self] in self.quizResolveFactory as Any }
        localTable["addQuizFactory-any AddQuizFactory"] = { [unowned self] in self.addQuizFactory as Any }
        localTable["makeQuizFactory-any MakeQuizFactory"] = { [unowned self] in self.makeQuizFactory as Any }
    }
}
extension AddQuizComponent: Registration {
    public func registerItems() {

    }
}
extension SplashComponent: Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.generateTokenUseCase] = "generateTokenUseCase-any GenerateTokenUseCase"
    }
}
extension QuizResolveComponent: Registration {
    public func registerItems() {
        keyPathToName[\QuizResolveDependency.fetchQuizzesUseCase] = "fetchQuizzesUseCase-any FetchQuizzesUseCase"
        keyPathToName[\QuizResolveDependency.postAnswerUseCase] = "postAnswerUseCase-any PostAnswerUseCase"
    }
}
extension MakeQuizComponent: Registration {
    public func registerItems() {
        keyPathToName[\MakeQuizDependency.postQuizUseCase] = "postQuizUseCase-any PostQuizUseCase"
        keyPathToName[\MakeQuizDependency.imageUploadUseCase] = "imageUploadUseCase-any ImageUploadUseCase"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.homeFactory] = "homeFactory-any HomeFactory"
        keyPathToName[\RootDependency.splashFactory] = "splashFactory-any SplashFactory"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.quizResolveFactory] = "quizResolveFactory-any QuizResolveFactory"
        keyPathToName[\HomeDependency.makeQuizFactory] = "makeQuizFactory-any MakeQuizFactory"
        keyPathToName[\HomeDependency.fetchAnswersUseCase] = "fetchAnswersUseCase-any FetchAnswersUseCase"
        keyPathToName[\HomeDependency.fetchAnswerDetailUseCase] = "fetchAnswerDetailUseCase-any FetchAnswerDetailUseCase"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->AddQuizComponent", factory5a83d66bace252942438e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->QuizResolveComponent", factorye2552b98a0872927f159f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MakeQuizComponent", factoryda695f07f9f90d1e0808f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
