import SwiftUI

public struct NalagImage: View {
    public enum Image {
        case logo
        case google
        case mc
        case github
        case defaultImage
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        toImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func toImage() -> SwiftUI.Image {
        switch image {
        case .logo:
            DesignSystemAsset.Images.logo.swiftUIImage

        case .google:
            DesignSystemAsset.Images.google.swiftUIImage

        case .mc:
            DesignSystemAsset.Images.mc.swiftUIImage

        case .github:
            DesignSystemAsset.Images.github.swiftUIImage

        case .defaultImage:
            DesignSystemAsset.Images.defaultImage.swiftUIImage
        }
    }
}
