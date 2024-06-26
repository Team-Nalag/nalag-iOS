import Moya
import Foundation
public enum AnyNalagAPI: TargetType {
    case api(any NalagAPI)

    public init(_ api: any NalagAPI) {
        self = .api(api)
    }

    public var api: any NalagAPI {
        switch self {
        case let .api(api):
            return api
        }
    }

    public var path: String { api.path }

    public var method: Moya.Method { api.method }

    public var baseURL: URL { api.baseURL }

    public var task: Moya.Task { api.task }

    public var headers: [String: String]? { api.headers }

    public var errorMap: [Int: Error] { api.errorMap }
}
