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
    private let categoryCoordinator: ICategoryCoordinator
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(
        moduleBuilder: IMainModuleBuilder,
        reicpeCoordinator: IRecipeCoordinator,
        categoryCoordinator: ICategoryCoordinator
    ) {
        self.moduleBuilder = moduleBuilder
        self.recipeCoordinator = reicpeCoordinator
        self.categoryCoordinator = categoryCoordinator
    }
    
    // MARK: IMainCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: MainPresenterOutput
    func onRecipeCellClicked(recipe: Int) {
        let viewController = recipeCoordinator.createFlow(recipeId: recipe)
        transitionHandler?.pushViewController(viewController, animated: true)
    }
    
    func onSeeAllButtonClicked(category: Section) {
        let viewController = categoryCoordinator.createFlow(category: category)
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
