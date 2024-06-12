import SwiftUI

public protocol JwtStoreFactory {
    func makeJwtStore() -> JwtStore
}
