//
//  MainTabBarCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import UIKit

protocol IMainTabBarCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class MainTabBarCoordinator: IMainTabBarCoordinator {
    func createFlow() -> UIViewController {
        let viewController = MainTabBarViewController()
        return viewController
    }
}
