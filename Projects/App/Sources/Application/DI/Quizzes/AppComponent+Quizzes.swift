import Foundation
import QuizzesDomainInterface
import QuizzesDomain
import NeedleFoundation

extension AppComponent {
    var remoteQuizzesDataSource: any RemoteQuizzesDataSource {
        shared {
            RemoteQuizzesDataSourcesImpl(networking: networking)
        }
    }

    var quizzesRepository: any QuizzesRepository {
        shared {
            QuizzesRepositoryImpl(remoteQuizzesDataSources: remoteQuizzesDataSource)
        }
    }

    var postQuizUseCase: any PostQuizUseCase {
        shared {
            PostQuizUseCaseImpl(quizzesRepository: quizzesRepository)
        }
    }

    var imageUploadUseCase: any ImageUploadUseCase {
        shared {
            ImageUploadUseCaseImpl(quizzesRepository: quizzesRepository)
        }
    }

    var fetchQuizzesUseCase: any FetchQuizzesUseCase {
        shared {
            FetchQuizzesUseCaseImpl(quizzesRepository: quizzesRepository)
        }
    }
}
