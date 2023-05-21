//
//  AppCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

final class AppCoordinator {
    // Dependencies
    private let authCoordinator: IAuthCoordinator
    private let mainTabBarCoordinator: IMainTabBarCoordinator
    
    // Properties
    var navigationContonroller: UINavigationController
    
    // MARK: Init
    
    init(
        appPresentationAssembly: IAppPresentationAssembly,
        navigationContonroller: UINavigationController
    ) {
        self.authCoordinator = appPresentationAssembly.authCoordinator
        self.navigationContonroller = navigationContonroller
        self.mainTabBarCoordinator = appPresentationAssembly.mainTabBarCoordinator
    }
    
    // MARK: Internal
    
    func createRootViewController() {
        let isAuth = false
        if isAuth {
            let viewController = mainTabBarCoordinator.createFlow(isAuth: isAuth)
            navigationContonroller.pushViewController(viewController, animated: true)
        } else {
            let viewController = authCoordinator.createFlow()
            navigationContonroller.pushViewController(viewController, animated: true)
        }
    }
}
