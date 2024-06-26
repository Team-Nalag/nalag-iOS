import Foundation

public struct AnswerDetailListResponseDTO: Decodable {
    public let answers: [AnswerResponseDTO]
    public let userName: String
    public let title: String
    public let choices: [AnswerDetailResponseDTO]

    enum CodingKeys: String, CodingKey {
        case answers
        case userName = "username"
        case title
        case choices
    }
}

public struct AnswerDetailResponseDTO: Decodable {
    public let content: String
    public let photo: String
    public let isAnswer: Bool

    enum CodingKeys: String, CodingKey {
        case content
        case photo
        case isAnswer = "is_answer"
    }
}

public extension AnswerDetailListResponseDTO {
    func toDomain() -> AnswerDetailListEntity {
        AnswerDetailListEntity(
            userName: self.userName,
            title: self.title,
            choices: self.choices.map {
                AnswerDetailEntity(
                    content: $0.content,
                    photo: $0.photo,
                    isAnswer: $0.isAnswer
                )
            }
        )
    }
}

public extension AnswerDetailResponseDTO {
    func toDomain() -> AnswerDetailEntity {
        AnswerDetailEntity(
            content: self.content,
            photo: self.photo,
            isAnswer: self.isAnswer
        )
    }
}
