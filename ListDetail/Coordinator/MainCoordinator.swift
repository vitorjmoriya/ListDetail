// MainCoordinator.swift

import SwiftUI

class MainCoordinator {
    let rootNavigationController: UINavigationController = .init()

    func start() {
        let tabController: UITabBarController = .init()

        let apiListController = ListController(coordinator: self, dataSource: .api)
        apiListController.tabBarItem.title = "API"
        let jsonListController = ListController(coordinator: self, dataSource: .json)
        jsonListController.tabBarItem.title = "JSON"

        tabController.setViewControllers([
            apiListController,
            jsonListController
        ], animated: false)

        self.rootNavigationController.setViewControllers([tabController], animated: false)
    }

    func navigateToDetail(id: String, tags: String) {
        self.rootNavigationController.pushViewController(
            DetailController(coordinator: self, id: id, tags: tags),
            animated: true
        )
    }
}
