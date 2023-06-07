//
//  YourRecipesCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol IYourRecipesCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class YourRecipesCoordinator: IYourRecipesCoordinator, YourRecipesPresenterOutput {
    // Dependencies
    private let moduleBuilder: IYourRecipesModuleBuilder
    private let createRecipeCoordinator: ICreateRecipeCoordinator
    private let recipeCoordinator: IRecipeCoordinator

    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(
        moduleBuilder: IYourRecipesModuleBuilder,
        createRecipeCoordinator: ICreateRecipeCoordinator,
        recipeCoordinator: IRecipeCoordinator
    ) {
        self.moduleBuilder = moduleBuilder
        self.createRecipeCoordinator = createRecipeCoordinator
        self.recipeCoordinator = recipeCoordinator
    }
    
    // MARK: IYourRecipesCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: YourRecipePresenterOutput

    func createRecipeButtonClicked() {
        let viewController = createRecipeCoordinator.createFlow()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
    func didSelectRecipe(recipe: Int) {
        let viewController = recipeCoordinator.createFlow(recipeId: recipe)
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
