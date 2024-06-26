import ComposableArchitecture
import Foundation
import BaseFeature
import UserDomainInterface
import Combine

public struct SplashStore: Reducer {
    private let generateTokenUseCase: any GenerateTokenUseCase

    public init(generateTokenUseCase: any GenerateTokenUseCase) {
        self.generateTokenUseCase = generateTokenUseCase
    }

    public struct State: Equatable {
        var isShowLoginButton: Bool = false
        var appState: SceneFlow = .splash
        var githubOAuthUrl = URL(string: "http://localhost:8080/oauth2/authorization/github")!
    }
    public enum Action: FeatureAction, Equatable {
        case view(ViewAction)
        case inner(InnerAction)
        case async(AsyncAction)
        case scope(ScopeAction)
        case delegate(DelegateAction)
    }

    public enum ViewAction: Equatable {
        case viewAppear
        case loginButtonDidTap
        case generateToken(code: String)
    }

    public enum AsyncAction: Equatable {}

    public enum InnerAction: Equatable {}

    public enum ScopeAction: Equatable {}

    public enum DelegateAction: Equatable {}

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .view(viewAction):
            switch viewAction {
            case .viewAppear:
                state.isShowLoginButton = true
                return .none

            case .loginButtonDidTap:
                state.appState = .home
                return .none

            case let .generateToken(code):
                return .run(operation: { send in
                    try await generateTokenUseCase.execute(code: code)
                    await send(.view(.loginButtonDidTap))
                })
            }
        default:
            return .none
        }
    }
}
