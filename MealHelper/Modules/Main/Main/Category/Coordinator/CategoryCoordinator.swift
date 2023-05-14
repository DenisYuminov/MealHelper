//
//  CategoryCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import UIKit

protocol ICategoryCoordinator: AnyObject {
    func createFlow(category: Section) -> UIViewController
}

final class CategoryCoordinator: ICategoryCoordinator, CategoryPresenterOutput {
    // Dependencies
    private let moduleBuilder: ICategoryModuleBuilder
    private let recipeCoordinator: IRecipeCoordinator
    
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: ICategoryModuleBuilder, recipeCoordinator: IRecipeCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.recipeCoordinator = recipeCoordinator
    }
    
    // MARK: ICategoryCoordinator
    
    func createFlow(category: Section) -> UIViewController {
        let viewController = moduleBuilder.build(output: self, category: category)
        transitionHandler = viewController
        return viewController
    }
    // MARK: CategoryPresenterOutput
    
    func onRecipeCellClicked(recipe: RecipeModel) {
        let viewController = recipeCoordinator.createFlow(recipe: recipe)
        transitionHandler?.navigationController?.pushViewController(viewController, animated: true)
    }
}
