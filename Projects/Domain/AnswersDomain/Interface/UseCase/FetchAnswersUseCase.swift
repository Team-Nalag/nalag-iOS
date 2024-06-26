import Foundation

public protocol FetchAnswersUseCase {
    func execute() async throws -> [AnswerEntity]
}
