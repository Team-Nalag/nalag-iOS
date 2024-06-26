import Foundation

public struct QuizResolveEntity: Equatable, Hashable {
    public let title: String
    public let quizId: String
    public let choices: [ChoiceResponseEntity]

    public init(title: String, quizId: String, choices: [ChoiceResponseEntity]) {
        self.title = title
        self.quizId = quizId
        self.choices = choices
    }
}
