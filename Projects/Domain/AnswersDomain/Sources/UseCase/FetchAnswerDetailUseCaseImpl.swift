import Foundation
import AnswersDomainInterface

public struct FetchAnswerDetailUseCaseImpl: FetchAnswerDetailUseCase {
    private let answersRepository: any AnswersRepository

    public init(answersRepository: any AnswersRepository) {
        self.answersRepository = answersRepository
    }

    public func execute(answerId: String) async throws -> AnswerDetailListEntity {
        try await answersRepository.fetchAnswerDetail(answerId: answerId)
    }
}
