import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue,
    targets: [
        .implements(
            module: .shared(.GlobalThirdPartyLibrary),
            product: .staticFramework,
            dependencies:
                [
                    .SPM.KeychainSwift,
                    .SPM.Moya,
                    .SPM.CombineMoya,
                    .SPM.ComposableArchitecture,
                    .SPM.Needle
                ]
        )
    ]
)
