import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.QuizResolveFeature.rawValue,
    targets: [
        .interface(module: .feature(.QuizResolveFeature)),
        .implements(module: .feature(.QuizResolveFeature), dependencies: [
            .feature(target: .QuizResolveFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .testing(module: .feature(.QuizResolveFeature), dependencies: [
            .feature(target: .QuizResolveFeature, type: .interface)
        ]),
        .tests(module: .feature(.QuizResolveFeature), dependencies: [
            .feature(target: .QuizResolveFeature)
        ]),
        .demo(module: .feature(.QuizResolveFeature), dependencies: [
            .feature(target: .QuizResolveFeature)
        ])
    ]
)
