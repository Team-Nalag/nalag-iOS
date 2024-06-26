import ComposableArchitecture
import BaseFeature
import AnswersDomainInterface
import Combine

public struct HomeStore: Reducer {
    private let fetctAnswersUseCase: any FetchAnswersUseCase
    private let fetchAnswerDetailUseCase: any FetchAnswerDetailUseCase

    public init(
        fetctAnswersUseCase: any FetchAnswersUseCase,
        fetchAnswerDetailUseCase: any FetchAnswerDetailUseCase
    ) {
        self.fetctAnswersUseCase = fetctAnswersUseCase
        self.fetchAnswerDetailUseCase = fetchAnswerDetailUseCase
    }

    public struct State: Equatable {
        var isNavigateToQuizResolve: Bool = false
        var isNavigateToMakeQuiz: Bool = false
        var answers: [AnswerEntity] = []
        var answerDetail: [AnswerDetailEntity] = []
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
        case navigationToMakeQuiz
        case popToQuizResolve
        case popToMakeQuiz
        case viewAppear
        case cellDidTap(answesrId: String)
        case updateAnswers(answers: [AnswerEntity])
        case updateAnswerDetail(answerDetail: [AnswerDetailEntity])
    }

    public enum AsyncAction: Equatable {
        case fetchAnswers
        case fetchAnswerDetail(answesrId: String)
    }

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

            case .popToMakeQuiz:
                state.isNavigateToMakeQuiz = false
                return .none

            case .navigationToMakeQuiz:
                state.isNavigateToMakeQuiz = true
                return .none

            case .popToQuizResolve:
                state.isNavigateToQuizResolve = false
                return .none

            case let .cellDidTap(id):
                return .send(.async(.fetchAnswerDetail(answesrId: id)))

            case .viewAppear:
                return .send(.async(.fetchAnswers))

            case let .updateAnswers(answers):
                state.answers = answers
                return .none

            case let .updateAnswerDetail(answerDetail):
                state.answerDetail = answerDetail
                return .none
            }

        case let .async(asyncAction):
            switch asyncAction {
            case .fetchAnswers:
                return .run(operation: { send in
                    do {
                        let response = try await fetctAnswersUseCase.execute()
                        await send(.view(.updateAnswers(answers: response)))
                    } catch {
                        print(error.localizedDescription)
                    }
                })

            case let .fetchAnswerDetail(answesrId):
                return .run(operation: { send in
                    do {
                        let response = try await fetchAnswerDetailUseCase.execute(answerId: answesrId)
                        await send(
                            .view(.updateAnswerDetail(answerDetail: response.choices)),
                            animation: .easeIn
                        )
                    } catch {
                        print(error.localizedDescription)
                    }
                })
            }

        default:
            return .none
        }
    }
}
