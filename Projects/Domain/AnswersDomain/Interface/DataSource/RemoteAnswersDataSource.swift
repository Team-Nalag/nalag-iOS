import Foundation

public protocol RemoteAnswersDataSource {
    func fetchAnswers() async throws -> [AnswerEntity]
    func fetchAnswerDetail(answerId: String) async throws -> AnswerDetailListEntity
    func postAnswer(quizId: String, answerId: String) async throws
}
