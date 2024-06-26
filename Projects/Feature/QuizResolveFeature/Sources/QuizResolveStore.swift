import ComposableArchitecture
import Moya
import BaseFeature
import Combine
import Foundation
import CombineSchedulers
import QuizzesDomainInterface
import AnswersDomainInterface

public struct QuizResolveStore: Reducer {
    private let fetchQuizzesUseCase: any FetchQuizzesUseCase
    private let postAnswerUseCase: any PostAnswerUseCase

    public init(
        fetchQuizzesUseCase: any FetchQuizzesUseCase,
        postAnswerUseCase: any PostAnswerUseCase
    ) {
        self.fetchQuizzesUseCase = fetchQuizzesUseCase
        self.postAnswerUseCase = postAnswerUseCase
    }

    public struct State: Equatable {
        var title: String = ""
        var quizId: String = ""
        var choices: [ChoiceResponseEntity] = []
        var isOpen: Bool = false
        var opacity: CGFloat = 0
        var subscriptions = Set<AnyCancellable>()
        var count = 0
        var selectedCell: String = ""
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
        case quizStart
        case updateQuiz(QuizResolveEntity)
        case answerClick(answerId: String)
        case successPostAnswer
    }

    public enum AsyncAction: Equatable {
        case fetchQuizList
        case postQuiz(quizId: String, answerId: String)
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

            case .quizStart:
                state.isOpen = true
                state.opacity = 1
                return .send(.async(.fetchQuizList))

            case let .updateQuiz(quiz):
                state.title = quiz.title
                state.quizId = quiz.quizId
                state.choices = quiz.choices
                return .none

            case let .answerClick(answerId):
                state.selectedCell = answerId
                return .send(.async(.postQuiz(quizId: state.quizId, answerId: answerId)))

            case .successPostAnswer:
                state.isOpen = false
                state.opacity = 0
                state.count += 1
                state.selectedCell = ""
                return .none
            }

        case let .async(asyncAction):
            switch asyncAction {
            case .fetchQuizList:
                return .run(operation: { send in
                    do {
                        let response = try await fetchQuizzesUseCase.execute()
                        await send(
                            .view(.updateQuiz(response)),
                            animation: .easeIn
                        )
                    } catch {
                        print(error.localizedDescription)
                    }
                })

            case let .postQuiz(quizId, answerId):
                return .run(operation: { send in
                    do {
                        try await postAnswerUseCase.execute(
                            quizId: quizId,
                            answerId: answerId
                        )
                        await send(.view(.successPostAnswer), animation: .easeIn)
                    } catch {
                        print((error as? MoyaError)?.response?.statusCode)
                    }
                })
            }

        default:
            return .none
        }
    }
}
