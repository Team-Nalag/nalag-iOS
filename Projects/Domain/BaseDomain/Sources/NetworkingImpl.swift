import Moya
import JwtStoreInterface
import Foundation
import BaseDomainInterface
import Combine

public class NetworkingImpl: Networking {
    typealias API = AnyNalagAPI
    private let provider: MoyaProvider<API>
    private let jwtStore: any JwtStore

    public init(jwtStore: any JwtStore) {
        self.jwtStore = jwtStore
        self.provider =  MoyaProvider<API>(
            plugins: [JwtPlugin(jwtStore: jwtStore), MoyaLoggingPlugin()]
        )
    }

    public func request<T>(_ api: any NalagAPI, dto: T.Type) async throws -> T where T: Decodable {
        let newAPI = AnyNalagAPI.api(api)
        let response = try await defaultRequest(newAPI)
        return try JSONDecoder().decode(dto, from: response.data)
    }

    public func request(_ api: any NalagAPI) async throws {
        let newAPI = AnyNalagAPI.api(api)
        _ = try await defaultRequest(newAPI)
    }

}

private extension NetworkingImpl {
    @discardableResult
    func defaultRequest(_ api: API) async throws -> Response {
        try await _Concurrency.Task.retrying(
            priority: _Concurrency.Task.currentPriority
        ) {
            do {
                return try await self.provider.request(api: api)
            } catch {
                guard
                    let moyaError = error as? MoyaError,
                    let httpResponse = moyaError.response
                else {
                    throw error
                }
                throw api.errorMap[httpResponse.statusCode] ?? error
            }
        }
        .value
    }
}

private extension MoyaProvider {
    func request(api: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            self.request(api, completion: continuation.resume(with:))
        }
    }
}

private extension _Concurrency.Task where Failure == Error {
    @discardableResult
    static func retrying(
        priority: TaskPriority? = nil,
        maxRetryCount: Int = 2,
        retryDelay: TimeInterval = 0.5,
        operation: @Sendable @escaping () async throws -> Success
    ) -> _Concurrency.Task<Success, Failure> {
        _Concurrency.Task(priority: priority) {
            for _ in 0..<maxRetryCount {
                do {
                    return try await operation()
                } catch {
                    let oneSecond = TimeInterval(1_000_000_000)
                    let delay = UInt64(oneSecond * retryDelay)
                    try await _Concurrency.Task<Never, Never>.sleep(nanoseconds: delay)
                    continue
                }
            }

            try _Concurrency.Task<Never, Never>.checkCancellation()
            return try await operation()
        }
    }
}
