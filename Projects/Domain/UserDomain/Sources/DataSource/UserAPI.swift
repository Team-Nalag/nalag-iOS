import Moya
import UserDomainInterface
import Foundation
import BaseDomainInterface

public enum UserAPI {
    case generateToken(code: String)
}

extension UserAPI: NalagAPI {
    public typealias ErrorType = UserDomainError

    public var jwtTokenType: JwtTokenType {
        return .none
    }

    public var urlPath: String {
        return "/github"
    }

    public var method: Moya.Method {
        return .get
    }

    public var domain: NalagDomain {
        .users
    }

    public var task: Task {
        switch self {
        case let .generateToken(code):
            return .requestParameters(
                parameters:
                    [
                        "code": code
                    ],
                encoding: URLEncoding.queryString
            )
        }
    }

    public var errorMap: [Int: UserDomainError] {
        return [:]
    }
}
