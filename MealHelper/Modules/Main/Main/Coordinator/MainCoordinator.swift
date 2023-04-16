//
//  MainTabBarCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import UIKit

protocol IMainCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class MainCoordinator: IMainCoordinator, MainPresenterOutput {
    // Dependencies
    private let moduleBuilder: IMainModuleBuilder
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: IMainModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: IMainCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
}
