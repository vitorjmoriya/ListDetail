// MainCoordinator.swift

import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func start() {
        self.rootNavigationController.pushViewController(ListController(coordinator: self), animated: false)
    }
}
