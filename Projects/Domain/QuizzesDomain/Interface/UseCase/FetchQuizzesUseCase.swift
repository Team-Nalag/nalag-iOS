import Foundation

public protocol FetchQuizzesUseCase {
    func execute() async throws -> QuizResolveEntity
}
