import Foundation

public protocol UserRepository {
    func generateToken(code: String) async throws
}
