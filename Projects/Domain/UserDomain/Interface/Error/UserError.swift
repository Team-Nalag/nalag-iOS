import Foundation

public enum UserDomainError: Error {
    case cannotFindUserRole
}

extension UserDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .cannotFindUserRole:
            return "Cannot find user role"
        }
    }
}
