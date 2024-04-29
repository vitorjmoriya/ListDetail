// SnapshotTesting+iPhone15.swift

import SnapshotTesting
import UIKit

extension ViewImageConfig {
    public static let iPhone15 = ViewImageConfig.iPhone15(.portrait)

    public static func iPhone15(_ orientation: Orientation) -> ViewImageConfig {
        let safeArea: UIEdgeInsets
        let size: CGSize
        switch orientation {
        case .landscape:
            safeArea = .init(top: 0, left: 59, bottom: 21, right: 59)
            size = .init(width: 852, height: 393)
        case .portrait:
            safeArea = .init(top: 59, left: 0, bottom: 34, right: 0)
            size = .init(width: 393, height: 852)
        }

        return .init(safeArea: safeArea, size: size, traits: .iPhone15(orientation))
    }
}

extension UITraitCollection {
    public static func iPhone15(_ orientation: ViewImageConfig.Orientation) -> UITraitCollection {
        let base: [UITraitCollection] = [
            .init(forceTouchCapability: .unavailable),
            .init(layoutDirection: .leftToRight),
            .init(preferredContentSizeCategory: .medium),
            .init(userInterfaceIdiom: .phone)
        ]
        switch orientation {
        case .landscape:
            return .init(
                traitsFrom: base + [
                    .init(horizontalSizeClass: .regular),
                    .init(verticalSizeClass: .compact)
                ]
            )
        case .portrait:
            return .init(
                traitsFrom: base + [
                    .init(horizontalSizeClass: .compact),
                    .init(verticalSizeClass: .regular)
                ]
            )
        }
    }
}
