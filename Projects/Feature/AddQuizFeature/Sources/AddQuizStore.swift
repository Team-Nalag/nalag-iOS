import ComposableArchitecture
import BaseFeature

public struct AddQuizStore: Reducer {

    public struct State: Equatable {
        var isNavigateToQuizResolve: Bool = false
    }

    public enum Action: FeatureAction, Equatable {
        case view(ViewAction)
        case inner(InnerAction)
        case async(AsyncAction)
        case scope(ScopeAction)
        case delegate(DelegateAction)
    }

    public enum ViewAction: Equatable {
        case navigationToQuizResolve
        case popToQuizResolve
    }

    public enum AsyncAction: Equatable {}

    public enum InnerAction: Equatable {}

    public enum ScopeAction: Equatable {}

    public enum DelegateAction: Equatable {}

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .view(viewAction):
            switch viewAction {
            case .navigationToQuizResolve:
                state.isNavigateToQuizResolve = true
                return .none

            case .popToQuizResolve:
                state.isNavigateToQuizResolve = false
                return .none
            }

        default:
            return .none
        }
    }
}
