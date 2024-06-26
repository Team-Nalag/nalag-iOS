import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    targets: [
        .interface(module: .domain(.BaseDomain), dependencies: [
            .shared(target: .GlobalThirdPartyLibrary)
        ]),
        .implements(module: .domain(.BaseDomain), dependencies: [
            .shared(target: .GlobalThirdPartyLibrary),
            .core(target: .JwtStore),
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .tests(module: .domain(.BaseDomain), dependencies: [
            .domain(target: .BaseDomain)
        ])
    ]
)
