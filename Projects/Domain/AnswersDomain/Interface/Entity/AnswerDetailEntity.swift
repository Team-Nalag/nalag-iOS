import Foundation

public struct AnswerDetailListEntity: Equatable {
    public let userName: String
    public let title: String
    public let choices: [AnswerDetailEntity]

    public init(userName: String, title: String, choices: [AnswerDetailEntity]) {
        self.userName = userName
        self.title = title
        self.choices = choices
    }
}

public struct AnswerDetailEntity: Equatable, Hashable {
    public let content: String
    public let photo: String
    public let isAnswer: Bool

    public init(content: String, photo: String, isAnswer: Bool) {
        self.content = content
        self.photo = photo
        self.isAnswer = isAnswer
    }
}
