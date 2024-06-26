import Foundation

public struct QuizRequestDTO: Encodable {
    public let title: String
    public let choice: [ChoiceRequestDTO]

    public init(title: String, choice: [ChoiceRequestDTO]) {
        self.title = title
        self.choice = choice
    }

    enum CodingKeys: String, CodingKey {
        case title
        case choice
    }
}
