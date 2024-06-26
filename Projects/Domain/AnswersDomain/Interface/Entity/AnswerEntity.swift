import Foundation

public struct AnswerEntity: Identifiable, Equatable, Hashable {
    public let id: String
    public let userName: String
    public let title: String
    public let choices: [AnswerDetailEntity]

    public init(id: String, userName: String, title: String, choices: [AnswerDetailEntity]) {
        self.id = id
        self.userName = userName
        self.title = title
        self.choices = choices
    }
}
