// MainCoordinator.swift

import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController = .init()

    func start() {
        self.rootNavigationController.setViewControllers([ListController(coordinator: self)], animated: false)
    }

    func navigateToDetail(id: String) {
        self.rootNavigationController.pushViewController(DetailController(coordinator: self, id: id), animated: true)
    }
}
