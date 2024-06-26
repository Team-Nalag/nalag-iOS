import Foundation

public protocol AnswersRepository {
    func fetchAnswers() async throws -> [AnswerEntity]
    func fetchAnswerDetail(answerId: String) async throws -> AnswerDetailListEntity
    func postAnswer(quizId: String, answerId: String) async throws

}
