import Moya
import Foundation
import NetworkingInterface

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
        return .post
    }

    public var domain: NalagDomain {
        .user
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
