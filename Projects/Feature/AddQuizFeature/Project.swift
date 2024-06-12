import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.AddQuizFeature.rawValue,
    targets: [
        .interface(module: .feature(.AddQuizFeature)),
        .implements(module: .feature(.AddQuizFeature), dependencies: [
            .feature(target: .AddQuizFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .testing(module: .feature(.AddQuizFeature), dependencies: [
            .feature(target: .AddQuizFeature, type: .interface)
        ]),
        .tests(module: .feature(.AddQuizFeature), dependencies: [
            .feature(target: .AddQuizFeature)
        ]),
        .demo(module: .feature(.AddQuizFeature), dependencies: [
            .feature(target: .AddQuizFeature)
        ])
    ]
)
