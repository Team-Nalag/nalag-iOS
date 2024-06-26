import Foundation
import QuizzesDomainInterface

public struct ImageUploadUseCaseImpl: ImageUploadUseCase {
    private let quizzesRepository: QuizzesRepository

    public init(quizzesRepository: QuizzesRepository) {
        self.quizzesRepository = quizzesRepository
    }

    public func execute(file: Data) async throws -> URLEntity {
        try await quizzesRepository.imageUpload(file: file)
    }

}
