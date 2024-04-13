// SceneDelegate.swift

import UIKit
import os

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private let mainCoordinator = MainCoordinator()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else {
            os_log("SceneDelegate.scene(_:willConnectTo:options) ignored (no UIWindowScene)")
            return
        }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = mainCoordinator.rootNavigationController

        self.mainCoordinator.start()
    }
}
