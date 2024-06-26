import Foundation
import Moya

public protocol NalagAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: NalagDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension NalagAPI {
    var baseURL: URL {
        URL(
            string: "http://localhost:8080"
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum NalagDomain: String {
    case quizzes
    case answers
    case users
}

extension NalagDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
