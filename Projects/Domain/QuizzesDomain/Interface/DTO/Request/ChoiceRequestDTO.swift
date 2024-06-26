import Foundation

public struct ChoiceRequestDTO: Encodable, Hashable {
    public let content: String
    public let photo: String

    public init(content: String, photo: String) {
        self.content = content
        self.photo = photo
    }

    enum CodingKeys: String, CodingKey {
        case content
        case photo
    }
}
