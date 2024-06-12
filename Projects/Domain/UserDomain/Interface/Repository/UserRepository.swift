import Foundation

public protocol UserRepository {
    func generateToken(code: Data) async throws
}
