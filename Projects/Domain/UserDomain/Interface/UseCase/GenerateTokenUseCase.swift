import Foundation

public protocol GenerateTokenUseCase {
    func execute(code: String) async throws
}
