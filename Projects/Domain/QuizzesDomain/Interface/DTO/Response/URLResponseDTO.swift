import Foundation

public struct URLResponseDTO: Decodable {
    public let url: String
}

public extension URLResponseDTO {
    public func toDomain() -> URLEntity {
        return URLEntity(
            url: self.url
        )
    }
}
