//
//  LikesCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol ILikesCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class LikesCoordinator: ILikesCoordinator, LikesPresenterOutput {
    // Dependencies
    private let moduleBuilder: ILikesModuleBuilder
    private let recipeCoordinator: IRecipeCoordinator
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: ILikesModuleBuilder, recipeCoordinator: IRecipeCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.recipeCoordinator = recipeCoordinator
    }
    
    // MARK: ILikesCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    // MARK: LikesPresenterOutput
    func didSelectRecipe(_ recipe: RecipeModel) {
        let viewController = recipeCoordinator.createFlow(recipe: recipe)
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
