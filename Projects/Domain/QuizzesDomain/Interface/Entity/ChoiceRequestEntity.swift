import Foundation

public struct ChoiceRequestEntity: Equatable, Hashable {
    public let content: String
    public let photo: String

    public init(content: String, photo: String) {
        self.content = content
        self.photo = photo
    }

}

public extension ChoiceRequestEntity {
    func toDomain() -> ChoiceRequestDTO {
        return .init(content: self.content, photo: self.photo)
    }
}
