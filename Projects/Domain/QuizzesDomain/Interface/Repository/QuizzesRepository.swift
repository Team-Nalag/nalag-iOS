import Combine
import Foundation

public protocol QuizzesRepository {
    func postQuizzes(req: QuizRequestDTO) async throws
    func imageUpload(file: Data) async throws -> URLEntity
    func fetchQuizzes() async throws -> QuizResolveEntity
}
