import Foundation

public protocol PostAnswerUseCase {
    func execute(quizId: String, answerId: String) async throws
}
