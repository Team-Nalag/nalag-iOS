import Foundation
import UserDomain
import UserDomainInterface
import NeedleFoundation
import BaseDomain

public extension AppComponent {
    var remoteUserDataSource: any RemoteUserDataSource {
        shared {
            RemoteUserDataSourceImpl(networking: NetworkingImpl(jwtStore: jwtStore))
        }
    }
    
    var userRepository: any UserRepository {
        shared {
            UserRepositoryImpl(remoteUserDataSource: remoteUserDataSource)
        }
    }
    
    var generateTokenUseCase: any GenerateTokenUseCase {
        shared {
            GenerateTokenUseCaseImpl(userRepository: userRepository)
        }
    }
}
