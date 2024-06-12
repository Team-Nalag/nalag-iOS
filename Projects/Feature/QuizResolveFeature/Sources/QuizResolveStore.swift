import ComposableArchitecture
import BaseFeature
import Combine
import Foundation
import CombineSchedulers

public struct QuizResolveStore: Reducer {
    public struct State: Equatable {
        var quizList: [String] = []
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
    }

    public enum AsyncAction: Equatable {
        case fetchQuizList
    }

    public enum InnerAction: Equatable {}

    public enum ScopeAction: Equatable {}

    public enum DelegateAction: Equatable {}

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case let .view(viewAction):
            switch viewAction {
            case .viewAppear:
                return .send(.async(.fetchQuizList))
            }

        case let .async(asyncAction):
            switch asyncAction {
            case .fetchQuizList:
                state.quizList = ["asdf", "Asfd"]
                print(state.quizList)
                return .none
            }

        default:
            return .none
        }
    }
}
