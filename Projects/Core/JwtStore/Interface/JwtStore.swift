public enum JwtStoreType: String {
    case accessToken = "ACCESS-TOKEN"
}

public protocol JwtStore {
    func save(type: JwtStoreType, value: String)
    func load(type: JwtStoreType) -> String
    func delete(type: JwtStoreType)
}
