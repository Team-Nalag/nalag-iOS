//import SwiftUI
//import RootFeatureInterface
//import ViewUtil
//
//class Router: ObservableObject {
//
//    private let appComponent: AppComponent
//    private let root: Route
//
//    public init(
//        root: Route,
//        appComponent: AppComponent
//    ) {
//        self.appComponent = appComponent
//        self.root = root
//    }
//
//    enum Route: Hashable {
//        case root
//    }
//
//    @Published var path: NavigationPath = NavigationPath()
//
//    @ViewBuilder func view(for route: Route) -> some View {
//        switch route {
//        case .root:
//            appComponent.rootComponent.makeView()
//                .eraseToAnyView()
//        }
//    }
//
//    @ViewBuilder func start() -> some View {
//        Routing {
//            self.view(for: self.root)
//        }
//    }
//    
//    // Used by views to navigate to another view
//    func navigateTo(_ appRoute: Route) {
//        path.append(appRoute)
//    }
//    
//    // Used to go back to the previous screen
//    func navigateBack() {
//        path.removeLast()
//    }
//    
//    // Pop to the root screen in our hierarchy
//    func popToRoot() {
//        path.removeLast(path.count)
//    }
//}
