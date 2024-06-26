import Foundation
import AnswersDomainInterface

public struct FetchAnswersUseCaseImpl: FetchAnswersUseCase {
    private let answersRepository: any AnswersRepository

    public init(answersRepository: any AnswersRepository) {
        self.answersRepository = answersRepository
    }

    public func execute() async throws -> [AnswerEntity] {
        try await answersRepository.fetchAnswers()
    }
}
