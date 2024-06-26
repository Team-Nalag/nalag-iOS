import Foundation

public struct QuizEntity: Equatable {
    public let title: String
    public let choice: [ChoiceRequestEntity]

    public init(title: String, choice: [ChoiceRequestEntity]) {
        self.title = title
        self.choice = choice
    }
}
