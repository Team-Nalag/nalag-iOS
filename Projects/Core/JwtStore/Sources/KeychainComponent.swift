import NeedleFoundation
import JwtStoreInterface

public final class JwtStoreComponent: BootstrapComponent, JwtStoreFactory {
    public func makeJwtStore() -> JwtStore {
        JwtStoreImpl()
    }
}
