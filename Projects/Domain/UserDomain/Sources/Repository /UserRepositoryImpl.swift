import Combine
import UserDomainInterface

public final class UserRepositoryImpl: UserRepository {

    private let remoteUserDataSource: any RemoteUserDataSource

    public init(
        remoteUserDataSource: any RemoteUserDataSource
    ) {
        self.remoteUserDataSource = remoteUserDataSource
    }

    public func generateToken(code: String) async throws {
        try await remoteUserDataSource.generateToken(code: code)
    }
}
