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
    private let recipeCoordinator: IRecipeCoordinator
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: IMainModuleBuilder, reicpeCoordinator: IRecipeCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.recipeCoordinator = reicpeCoordinator
    }
    
    // MARK: IMainCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: MainPresenterOutput
    func onRecipeCellCkicked(recipe: Recipe) {
        let viewController = recipeCoordinator.createFlow()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
