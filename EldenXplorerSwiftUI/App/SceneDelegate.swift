//
//  SceneDelegate.swift
//  EldenXplorerSwiftUI
//
//  Created by Ertan Yağmur on 3.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let navigationController = AppNavigationControllerProvider.makeNavigationController()
    let mainViewController = BossListCoordinator(navigationController: navigationController).makeViewController()

    navigationController.setViewControllers([mainViewController], animated: false)
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    self.window = window
  }

}

