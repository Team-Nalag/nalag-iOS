import Foundation
import QuizzesDomainInterface

public class QuizzesRepositoryImpl: QuizzesRepository {
    private let remoteQuizzesDataSources: any RemoteQuizzesDataSource

    public init(remoteQuizzesDataSources: any RemoteQuizzesDataSource) {
        self.remoteQuizzesDataSources = remoteQuizzesDataSources
    }

    public func postQuizzes(req: QuizRequestDTO) async throws {
        try await remoteQuizzesDataSources.postQuizzes(req: req)
    }

    public func imageUpload(file: Data) async throws -> URLEntity {
        try await remoteQuizzesDataSources.imageUpload(file: file)
    }

    public func fetchQuizzes() async throws -> QuizzesDomainInterface.QuizResolveEntity {
        try await remoteQuizzesDataSources.fetchQuizzes()
    }
}
