// MainCoordinator.swift

import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController = .init()

    func start() {
        self.rootNavigationController.setViewControllers([ListController(coordinator: self)], animated: false)
    }

    func navigateToDetail(id: String, tags: String) {
        self.rootNavigationController.pushViewController(DetailController(coordinator: self, id: id, tags: tags), animated: true)
    }
}
