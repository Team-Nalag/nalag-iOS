import SwiftUI
import MakeQuizFeatureInterface
import Kingfisher
import DesignSystem
import ComposableArchitecture
import Combine
import Foundation

struct MakeQuizView: View {
    @Environment(\.dismiss) private var dismiss
    typealias MakeQuizAction = MakeQuizStore.Action
    private let store: StoreOf<MakeQuizStore>

    @ObservedObject private var viewStore: ViewStore<MakeQuizStore.State, MakeQuizAction.ViewAction>

    init(store: StoreOf<MakeQuizStore>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 }, send: { .view($0) })
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                TextField(text: viewStore.binding(
                    get: { $0.title },
                    send: { .titleDidChange($0) })) {
                    Text("질문을 입력해 주세요.")
                        .nalagFont(12, weight: .pretendard(.medium), color: Color.Main.main85)
                }
                .nalagFont(12, weight: .pretendard(.medium), color: Color.Main.main85)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
                .background(Color.white)
                .frame(width: 320)
                .clipCornerRadius(12)

                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<4) { index in
                        VStack(spacing: 20) {
                            if let image = viewStore.images[index] {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 156, height: 92)
                                    .clipCornerRadius(8)
                                    .onTapGesture {
                                        viewStore.send(.showImagePicker(index: index))
                                    }
                            } else {
                                NalagImage(.defaultImage)
                                    .frame(width: 30, height: 30)
                                    .padding(.horizontal, 63)
                                    .padding(.vertical, 31)
                                    .background(Color.Main.main10)
                                    .clipCornerRadius(8)
                                    .onTapGesture {
                                        viewStore.send(.showImagePicker(index: index))
                                    }
                            }

                            TextField(text: viewStore.binding(
                                get: { $0.text[index] },
                                send: { .textDidChange(index, $0)}
                            )) {
                                Text("선택지를 입력해주세요.")
                                    .nalagFont(12, weight: .pretendard(.medium), color: Color.Main.main80)
                            }
                            .nalagFont(12, weight: .pretendard(.medium), color: Color.Main.main80)
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 0))
                            .background(Color.Main.main10)
                            .clipCornerRadius(8)
                        }
                        .padding(16)
                        .background(Color.white)
                        .clipCornerRadius(16)
                    }
                }
            }
            HStack(spacing: 8) {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("취소")
                        .nalagFont(20, weight: .pretendard(.medium), color: Color.Main.main70)
                        .padding(EdgeInsets(top: 12, leading: 21, bottom: 12, trailing: 21))
                        .background(Color.white)
                        .clipCornerRadius(16)
                }
                Button {
                    viewStore.send(.postQuiz)
                    dismiss()
                } label: {
                    Text("완료")
                        .nalagFont(20, weight: .pretendard(.medium), color: Color.white)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(Color.Main.main70)
                        .clipCornerRadius(16)
                }
            }

            Spacer()
        }
        .sheet(isPresented: viewStore.binding(
            get: { $0.showImagePicker },
            send: .dismissPicker
        )) {
            ImagePicker(image: viewStore.binding(
                get: { $0.images[$0.currentIndex] },
                send: { .selectedImage($0!) }
            ))

        }
        .padding(.vertical, 20)
        .background(Color.Main.main5)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("퀴즈 생성")
        .navigationBarBackButtonHidden()
    }
}
