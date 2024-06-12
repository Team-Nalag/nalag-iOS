import Foundation
import Moya

public protocol Networking {
    associatedtype API = NalagAPI
    func request<T: Decodable>(_ api: API, dto: T.Type) async throws -> T
    func request(_ api: API) async throws
}
