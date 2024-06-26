import Foundation

public enum QuizzesDomainError: Error {
    case cannotFindQuiz
}

extension QuizzesDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .cannotFindQuiz:
            return "Cannot find quiz"
        }
    }
}
