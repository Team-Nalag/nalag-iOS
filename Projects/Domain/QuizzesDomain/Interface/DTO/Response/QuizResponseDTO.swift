import Foundation

public struct QuizResponseDTO: Decodable {
    public let title: String
    public let quizId: String
    public let choices: [ChoiceResponseDTO]

    enum CodingKeys: String, CodingKey {
        case title
        case quizId = "quiz_id"
        case choices
    }
}

public extension QuizResponseDTO {
    func toDomain() -> QuizResolveEntity {
        return QuizResolveEntity(
            title: self.title,
            quizId: self.quizId,
            choices: self.choices.map {
                $0.toDomain()
            }
        )
    }
}


public struct ChoiceResponseDTO: Decodable {
    public let id: String
    public let content: String
    public let photo: String

}

public extension ChoiceResponseDTO {
    func toDomain() -> ChoiceResponseEntity {
        return ChoiceResponseEntity(id: self.id, content: self.content, photo: self.photo)
    }
}
