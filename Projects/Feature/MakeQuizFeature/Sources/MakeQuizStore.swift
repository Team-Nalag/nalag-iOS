import ComposableArchitecture
import UIKit
import QuizzesDomainInterface
import BaseFeature
import Combine
import Foundation

public struct MakeQuizStore: Reducer {
    private let postQuizUseCase: any PostQuizUseCase
    private let imageUploadUseCase: any ImageUploadUseCase

    init(postQuizUseCase: any PostQuizUseCase, imageUploadUseCase: any ImageUploadUseCase) {
        self.postQuizUseCase = postQuizUseCase
        self.imageUploadUseCase = imageUploadUseCase
    }

    public struct State: Equatable {
        var title: String = ""
        var showImagePicker: Bool = false
        var choice: [ChoiceRequestEntity] = [
            .init(content: "", photo: ""),
            .init(content: "", photo: ""),
            .init(content: "", photo: ""),
            .init(content: "", photo: "")
        ]
        var images: [UIImage?] = [nil, nil, nil, nil]
        var text: [String] = ["", "", "", ""]
        var currentIndex: Int = 0
    }
    public enum Action: FeatureAction, Equatable {
        case view(ViewAction)
        case inner(InnerAction)
        case async(AsyncAction)
        case scope(ScopeAction)
        case delegate(DelegateAction)
    }

    public enum ViewAction: Equatable {
        case titleDidChange(String)
        case showImagePicker(index: Int)
        case dismissPicker
        case selectedImage(UIImage)
        case postQuiz
        case uploadImage(url: String)
        case textDidChange(Int, String)
    }

    public enum AsyncAction: Equatable {
        case imageUpload(UIImage)
        case postQuiz(String, [ChoiceRequestEntity])
    }

    public enum InnerAction: Equatable {}

    public enum ScopeAction: Equatable {}

    public enum DelegateAction: Equatable {}

    public func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .view(let viewAction):
            switch viewAction {
            case .titleDidChange(let string):
                state.title = string
                print(state.title)
                return .none

            case .showImagePicker(let index):
                state.currentIndex = index
                state.showImagePicker = true
                return .none

            case .dismissPicker:
                state.showImagePicker = false
                return .none

            case .selectedImage(let uiimage):
                state.images[state.currentIndex] = uiimage
                return .send(.async(.imageUpload(uiimage)))

            case .postQuiz:
                state.choice = state.text.enumerated().map {
                    ChoiceRequestEntity(content: $0.element, photo: state.choice[$0.offset].photo)
                }
                return .send(.async(.postQuiz(state.title, state.choice)))

            case .uploadImage(let url):
                state.choice[state.currentIndex] = .init(content: "", photo: url)
                return .none

            case let .textDidChange(index, text):
                state.text[index] = text
                return .none
            }
        case .async(let asyncAction):
            switch asyncAction {
            case .imageUpload(let uIImage):
                return .run(operation: { send in
                    do {
                        let response = try await imageUploadUseCase.execute(
                            file: (uIImage.jpegData(compressionQuality: 0.3))!
                        )
                        await send(.view(.uploadImage(url: response.url)))
                    } catch {
                        print(error.localizedDescription)
                    }
                })

            case let .postQuiz(title, data):
                return .run(operation: { send in
                    do {
                        try await postQuizUseCase.execute(
                            req: .init(
                                title: title,
                                choice: data.map {
                                    $0.toDomain()
                                }
                            )
                        )
//                        await send( .none
                    } catch {
                        print(error.localizedDescription)
                    }
                })
            }
        default:
            return .none
        }
    }
}
