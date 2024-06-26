import Foundation
import BaseDomainInterface
import QuizzesDomainInterface

public class RemoteQuizzesDataSourcesImpl: RemoteQuizzesDataSource {
    private let networking: any Networking

    public init(networking: any Networking) {
        self.networking = networking
    }

    public func postQuizzes(req: QuizRequestDTO) async throws {
        try await networking.request(QuizzesAPI.postQuiz(req: req))
    }

    public func imageUpload(file: Data) async throws -> URLEntity {
        try await networking.request(QuizzesAPI.imageUpload(file: file), dto: URLResponseDTO.self)
            .toDomain()
    }

    public func fetchQuizzes() async throws -> QuizResolveEntity {
        try await networking.request(QuizzesAPI.fetchQuizzes, dto: QuizResponseDTO.self)
            .toDomain()
    }

}
