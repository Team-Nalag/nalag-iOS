import Foundation

public struct ChoiceResponseEntity: Equatable, Hashable {
    public let id: String
    public let content: String
    public let photo: String

    public init(id: String, content: String, photo: String) {
        self.id = id
        self.content = content
        self.photo = photo
    }

}
