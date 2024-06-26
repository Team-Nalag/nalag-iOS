import Foundation

public protocol PostQuizUseCase {
    func execute(req: QuizRequestDTO) async throws
}
