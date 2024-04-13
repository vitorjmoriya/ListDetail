// MainCoordinator.swift

import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController = .init()

    func start() {
        self.rootNavigationController.pushViewController(ListController(coordinator: self), animated: false)
    }
}
