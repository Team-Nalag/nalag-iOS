import Foundation
import QuizzesDomainInterface

public struct PostQuizUseCaseImpl: PostQuizUseCase {
    private let quizzesRepository: QuizzesRepository

    public init(quizzesRepository: QuizzesRepository) {
        self.quizzesRepository = quizzesRepository
    }

    public func execute(req: QuizRequestDTO) async throws {
        try await quizzesRepository.postQuizzes(req: req)
    }
}
