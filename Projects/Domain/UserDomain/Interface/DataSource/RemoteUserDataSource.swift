import Foundation

public protocol RemoteUserDataSource {
    func generateToken(code: String) async throws
}
