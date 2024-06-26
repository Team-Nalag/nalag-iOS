import SwiftUI

public protocol MakeQuizFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
