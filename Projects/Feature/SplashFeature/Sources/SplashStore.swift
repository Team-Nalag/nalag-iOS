import ComposableArchitecture
import BaseFeature

public struct SplashStore: Reducer {
    public struct State: Equatable {
        var isShowLoginButton: Bool = false
        var appState: SceneFlow = .splash
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
            }
        default:
            return .none
        }
    }
}
