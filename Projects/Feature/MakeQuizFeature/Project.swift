import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.MakeQuizFeature.rawValue,
    targets: [
        .interface(module: .feature(.MakeQuizFeature)),
        .implements(module: .feature(.MakeQuizFeature), dependencies: [
            .feature(target: .MakeQuizFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .testing(module: .feature(.MakeQuizFeature), dependencies: [
            .feature(target: .MakeQuizFeature, type: .interface)
        ]),
        .tests(module: .feature(.MakeQuizFeature), dependencies: [
            .feature(target: .MakeQuizFeature)
        ]),
        .demo(module: .feature(.MakeQuizFeature), dependencies: [
            .feature(target: .MakeQuizFeature)
        ])
    ]
)
