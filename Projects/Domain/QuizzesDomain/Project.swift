import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.QuizzesDomain.rawValue,
    targets: [
        .interface(module: .domain(.QuizzesDomain)),
        .implements(module: .domain(.QuizzesDomain), dependencies: [
            .domain(target: .QuizzesDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.QuizzesDomain), dependencies: [
            .domain(target: .QuizzesDomain, type: .interface)
        ]),
        .tests(module: .domain(.QuizzesDomain), dependencies: [
            .domain(target: .QuizzesDomain)
        ]),
        .demo(module: .domain(.QuizzesDomain), dependencies: [
            .domain(target: .QuizzesDomain)
        ])
    ]
)
