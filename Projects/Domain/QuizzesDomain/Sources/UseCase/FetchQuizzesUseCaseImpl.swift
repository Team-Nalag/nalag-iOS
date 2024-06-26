import Foundation
import QuizResolveFeatureInterface
import QuizzesDomainInterface

public struct FetchQuizzesUseCaseImpl: FetchQuizzesUseCase {
    private let quizzesRepository: QuizzesRepository

    public init(quizzesRepository: QuizzesRepository) {
        self.quizzesRepository = quizzesRepository
    }

    public func execute() async throws -> QuizResolveEntity {
        try await quizzesRepository.fetchQuizzes()
    }
}
