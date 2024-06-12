import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    targets: [
        .interface(module: .domain(.BaseDomain)),
        .implements(module: .domain(.BaseDomain), dependencies: [
            .shared(target: .GlobalThirdPartyLibrary)
        ]),
        .tests(module: .domain(.BaseDomain), dependencies: [
            .domain(target: .BaseDomain)
        ])
    ]
)
