//
//  SceneDelegate.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // Dependencies
    var window: UIWindow?
    
    // MARK: UISceneDelegate
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let appCoordinator = AppCoordinator(
            appPresentationAssembly: AppPresentationAssembly(servicesAssembly: AppServicesAssembly())
        )
        window.rootViewController = appCoordinator.createRootViewController()
        window.makeKeyAndVisible()
    }
}
