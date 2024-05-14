import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.Router.rawValue,
    targets: [
        .interface(module: .shared(.Router)),
        .implements(module: .shared(.Router), dependencies: [
            .shared(target: .Router, type: .interface)
        ])
    ]
)
