import Foundation

public struct AnswersResponseDTO: Decodable {
    public let answers: [AnswerResponseDTO]
}

public struct AnswerResponseDTO: Decodable {
    public let id: String
    public let userName: String
    public let title: String
    public let choices: [AnswerDetailResponseDTO]

    enum CodingKeys: String, CodingKey {
        case id
        case userName = "username"
        case title
        case choices
    }
}

public extension AnswersResponseDTO {
    func toDomain() -> [AnswerEntity] {
        self.answers.map {
            AnswerEntity(
                id: $0.id,
                userName: $0.userName,
                title: $0.title,
                choices: $0.choices.map {
                    $0.toDomain()
                }
            )
        }
    }
}
