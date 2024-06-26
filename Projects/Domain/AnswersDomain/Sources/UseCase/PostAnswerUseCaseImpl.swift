import Foundation
import AnswersDomainInterface

public struct PostAnswerUseCaseImpl: PostAnswerUseCase {
    private let answersRepository: any AnswersRepository

    public init(answersRepository: any AnswersRepository) {
        self.answersRepository = answersRepository
    }

    public func execute(quizId: String, answerId: String) async throws {
        try await answersRepository.postAnswer(quizId: quizId, answerId: answerId)
    }
}
