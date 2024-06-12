import Foundation
import NetworkingInterface

final class RemoteUserDataSourceImpl: RemoteUserDataSource {
    private let networking: any Networking

    init(networking: any Networking) {
        self.networking = networking
    }

    func generateToken(code: String) async throws {
        try await networking.request()
    }
}
