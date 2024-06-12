import Moya
import Foundation
import JwtStoreInterface
import NetworkingInterface

public struct JwtPlugin: PluginType {
    private let jwtStore: any JwtStore

    public init(jwtStore: any JwtStore) {
        self.jwtStore = jwtStore
    }

    public func prepare(
        _ request: URLRequest,
        target: TargetType
    ) -> URLRequest {
        guard let jwtTokenType = (target as? JwtAuthorizable)?.jwtTokenType,
              jwtTokenType != .none
        else { return request }
        var req = request
        let token = "\(getToken(type: .accessToken))"

        req.addValue(token, forHTTPHeaderField: jwtTokenType.rawValue)
        return req
    }

    public func didReceive(
        _ result: Result<Response, MoyaError>,
        target: TargetType
    ) {
        switch result {
        case let .success(res):
            if let new = try? res.map(TokenDTO.self) {
                saveToken(token: new)
            }
        default:
            break
        }
    }
}

private extension JwtPlugin {
    func getToken(type: JwtTokenType) -> String {
        switch type {
        case .accessToken:
            return "Bearer \(jwtStore.load(type: .accessToken))"
        case .none:
            return ""
        }
    }

    func saveToken(token: TokenDTO) {
        jwtStore.save(type: .accessToken, value: token.accessToken)
    }
}
