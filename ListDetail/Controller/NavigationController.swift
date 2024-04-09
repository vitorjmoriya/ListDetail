// NavigationController.swift

import SwiftUI

struct NavigationController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    private let rootNavigationController: UINavigationController

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        self.rootNavigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        /* no op */
    }
}
