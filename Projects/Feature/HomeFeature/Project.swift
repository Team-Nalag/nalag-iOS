import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.HomeFeature.rawValue,
    targets: [
        .interface(module: .feature(.HomeFeature)),
        .implements(module: .feature(.HomeFeature), dependencies: [
            .feature(target: .HomeFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.HomeFeature), dependencies: [
            .feature(target: .HomeFeature)
        ]),
        .demo(module: .feature(.HomeFeature), dependencies: [
            .feature(target: .HomeFeature)
        ])
    ]
)
