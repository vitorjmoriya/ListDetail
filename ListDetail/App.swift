// App.swift

import SwiftUI

@main
struct MyApp: App {
    private let coordinator = MainCoordinator(rootNavigationController: .init())

    init() {
        coordinator.start()
    }

    var body: some Scene {
        WindowGroup {
            NavigationController(
                rootNavigationController: coordinator.rootNavigationController
            )
        }
    }
}
