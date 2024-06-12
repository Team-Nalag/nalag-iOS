import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.UserDomain.rawValue,
    targets: [
        .interface(module: .domain(.UserDomain)),
        .implements(module: .domain(.UserDomain), dependencies: [
            .domain(target: .UserDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.UserDomain), dependencies: [
            .domain(target: .UserDomain, type: .interface)
        ]),
        .tests(module: .domain(.UserDomain), dependencies: [
            .domain(target: .UserDomain)
        ]),
        .demo(module: .domain(.UserDomain), dependencies: [
            .domain(target: .UserDomain)
        ])
    ]
)
