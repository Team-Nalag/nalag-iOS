import SwiftUI

public protocol AddQuizFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
