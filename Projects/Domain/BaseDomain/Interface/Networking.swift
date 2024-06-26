import Foundation
import Moya

public protocol Networking {
    func request<T: Decodable>(_ api: any NalagAPI, dto: T.Type) async throws -> T
    func request(_ api: any NalagAPI) async throws
}
