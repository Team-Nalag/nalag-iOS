import Foundation
import AnswersDomainInterface
import AnswersDomain
import NeedleFoundation

extension AppComponent {
    var remoteAnswersDataSource: any RemoteAnswersDataSource {
        shared {
            RemoteAnswersDataSourceImpl(networking: networking)
        }
    }

    var answersRepository: any AnswersRepository {
        shared {
            AnswersRepositoryImpl(remoteAnswersDataSource: remoteAnswersDataSource)
        }
    }

    var fetchAnswersUseCase: any FetchAnswersUseCase {
        shared {
            FetchAnswersUseCaseImpl(answersRepository: answersRepository)
        }
    }

    var fetchAnswerDetailUseCase: any FetchAnswerDetailUseCase {
        shared {
            FetchAnswerDetailUseCaseImpl(answersRepository: answersRepository)
        }
    }

    var postAnswerUseCase: any PostAnswerUseCase {
        shared {
            PostAnswerUseCaseImpl(answersRepository: answersRepository)
        }
    }
}
