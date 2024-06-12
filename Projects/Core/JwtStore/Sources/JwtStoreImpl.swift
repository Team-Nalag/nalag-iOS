import KeychainSwift
import JwtStoreInterface

public struct JwtStoreImpl: JwtStore {
    private let keychain = KeychainSwift()

    public init() {}

    public func save(type: JwtStoreType, value: String) {
        keychain.set(value, forKey: type.rawValue)
    }

    public func load(type: JwtStoreType) -> String {
        return keychain.get(type.rawValue) ?? ""
    }

    public func delete(type: JwtStoreType) {
         keychain.delete(type.rawValue)
    }
}
