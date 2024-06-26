import Foundation
import UserDomainInterface

public struct GenerateTokenUseCaseImpl: GenerateTokenUseCase {
    private let userRepository: UserRepository

    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    public func execute(code: String) async throws {
        try await userRepository.generateToken(code: code)
    }
}
