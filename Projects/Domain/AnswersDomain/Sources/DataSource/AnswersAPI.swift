import Moya
import Foundation
import BaseDomainInterface
import QuizzesDomainInterface

public enum AnswersAPI {
    case fetchAnswers
    case fetchAnswerDetail(answerId: String)
    case postAnswer(quizId: String, answerId: String)
}

extension AnswersAPI: NalagAPI {
    public typealias ErrorType = Error

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var urlPath: String {
        switch self {
        case let .fetchAnswerDetail(answerId):
            return "/details/\(answerId)"

        case .fetchAnswers:
            return ""

        case let .postAnswer(quizId, answerId):
            return "/\(quizId)/\(answerId)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchAnswers, .fetchAnswerDetail:
            return .get

        default:
            return .post
        }
    }

    public var domain: NalagDomain {
        return .answers
    }

    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    public var errorMap: [Int: Error] {
        return [:]
    }
}
