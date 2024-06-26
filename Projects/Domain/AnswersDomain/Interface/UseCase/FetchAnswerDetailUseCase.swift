import Foundation

public protocol FetchAnswerDetailUseCase {
    func execute(answerId: String) async throws -> AnswerDetailListEntity
}
