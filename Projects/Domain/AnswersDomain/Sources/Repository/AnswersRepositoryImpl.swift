import Foundation
import AnswersDomainInterface

public class AnswersRepositoryImpl: AnswersRepository {

    private let remoteAnswersDataSource: any RemoteAnswersDataSource

    public init(remoteAnswersDataSource: any RemoteAnswersDataSource) {
        self.remoteAnswersDataSource = remoteAnswersDataSource
    }

    public func fetchAnswers() async throws -> [AnswerEntity] {
        try await remoteAnswersDataSource.fetchAnswers()
    }

    public func fetchAnswerDetail(answerId: String) async throws -> AnswerDetailListEntity {
        try await remoteAnswersDataSource.fetchAnswerDetail(answerId: answerId)
    }

    public func postAnswer(quizId: String, answerId: String) async throws {
        try await remoteAnswersDataSource.postAnswer(quizId: quizId, answerId: answerId)
    }

}
