import Foundation
import UserDomainInterface
import BaseDomainInterface

public final class RemoteUserDataSourceImpl: RemoteUserDataSource {
    private let networking: any Networking

    public init(networking: any Networking) {
        self.networking = networking
    }

    public func generateToken(code: String) async throws {
        try await networking.request(UserAPI.generateToken(code: code))
    }
}
