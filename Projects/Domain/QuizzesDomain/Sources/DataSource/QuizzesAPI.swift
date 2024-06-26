import Moya
import Foundation
import BaseDomainInterface
import QuizzesDomainInterface

public enum QuizzesAPI {
    case postQuiz(req: QuizRequestDTO)
    case imageUpload(file: Data)
    case fetchQuizzes
}

extension QuizzesAPI: NalagAPI {
    public typealias ErrorType = QuizzesDomainError

    public var jwtTokenType: JwtTokenType {
        return .accessToken
    }

    public var urlPath: String {
        switch self {
        case .imageUpload:
            return "/upload"

        case .postQuiz, .fetchQuizzes:
            return "/"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchQuizzes:
            return .get

        default:
            return .post
        }
    }

    public var domain: NalagDomain {
        return .quizzes
    }

    public var task: Task {
        switch self {
        case let .postQuiz(req):
            return .requestJSONEncodable(req)

        case let .imageUpload(file):
            let gifData = MultipartFormData(provider: .data(file), name: "file", fileName: "jpng.jpeg", mimeType: "image/jpeg")
            return .uploadMultipart([gifData])

        default:
            return .requestPlain
        }
    }

    public var errorMap: [Int: QuizzesDomainError] {
        return [:]
    }
}
