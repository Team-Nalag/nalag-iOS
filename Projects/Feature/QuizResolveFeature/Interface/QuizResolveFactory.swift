import SwiftUI

public protocol QuizResolveFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
