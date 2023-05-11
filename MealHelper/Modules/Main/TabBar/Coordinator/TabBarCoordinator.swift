//
//  TabBarCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol IMainTabBarCoordinator: AnyObject {
    func createFlow(isAuth: Bool) -> UIViewController
}

class MainTabBarCoordinator: IMainTabBarCoordinator {
    // Dependencies
    private let mainCoordinator: IMainCoordinator
    private let likesCoordinator: ILikesCoordinator
    private let yourRecipesCoordinator: IYourRecipesCoordinator
    private let settignsCoordinator: ISettingsCoordinator
    
    // Properties
    private weak var tabBarController: UITabBarController?
    
    init(
        mainCoordinator: IMainCoordinator,
        likesCoordinator: ILikesCoordinator,
        yourRecipesCoordinator: IYourRecipesCoordinator,
        settignsCoordinator: ISettingsCoordinator
    ) {
        self.mainCoordinator = mainCoordinator
        self.likesCoordinator = likesCoordinator
        self.yourRecipesCoordinator = yourRecipesCoordinator
        self.settignsCoordinator = settignsCoordinator
    }
        
    func createFlow(isAuth: Bool) -> UIViewController {
        let tabBarController = UITabBarController()
        self.tabBarController = tabBarController
        if !isAuth {
            tabBarController.viewControllers = [
                mainCoordinator.createFlow(),
                likesCoordinator.createFlow(),
                settignsCoordinator.createFlow()
            ]
        } else {
            tabBarController.viewControllers = [
                mainCoordinator.createFlow(),
                likesCoordinator.createFlow(),
                yourRecipesCoordinator.createFlow(),
                settignsCoordinator.createFlow()
            ]
        }
        return tabBarController
    }
}
