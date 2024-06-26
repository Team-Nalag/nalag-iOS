import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AnswersDomain.rawValue,
    targets: [
        .interface(module: .domain(.AnswersDomain)),
        .implements(module: .domain(.AnswersDomain), dependencies: [
            .domain(target: .AnswersDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.AnswersDomain), dependencies: [
            .domain(target: .AnswersDomain, type: .interface)
        ]),
        .demo(module: .domain(.AnswersDomain), dependencies: [
            .domain(target: .AnswersDomain)
        ])
    ]
)
