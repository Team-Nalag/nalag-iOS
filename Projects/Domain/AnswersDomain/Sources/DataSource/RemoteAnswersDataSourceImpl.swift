import AnswersDomainInterface
import BaseDomainInterface

public class RemoteAnswersDataSourceImpl: RemoteAnswersDataSource {

    private let networking: any Networking

    public init(networking: any Networking) {
        self.networking = networking
    }

    public func fetchAnswers() async throws -> [AnswerEntity] {
        try await networking.request(AnswersAPI.fetchAnswers, dto: AnswersResponseDTO.self)
            .toDomain()
    }

    public func fetchAnswerDetail(answerId: String) async throws -> AnswerDetailListEntity {
        try await networking.request(
            AnswersAPI.fetchAnswerDetail(answerId: answerId),
            dto: AnswerDetailListResponseDTO.self
        )
        .toDomain()
    }

    public func postAnswer(quizId: String, answerId: String) async throws {
        try await networking.request(AnswersAPI.postAnswer(quizId: quizId, answerId: answerId))
    }

}
