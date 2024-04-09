// MainCoordinator.swift

import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func start() {
        self.rootNavigationController.pushViewController(UIHostingController(rootView: ContentView()), animated: false)
    }
}
