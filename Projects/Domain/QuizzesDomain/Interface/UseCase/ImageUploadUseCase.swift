import Foundation

public protocol ImageUploadUseCase {
    func execute(file: Data) async throws -> URLEntity
}
