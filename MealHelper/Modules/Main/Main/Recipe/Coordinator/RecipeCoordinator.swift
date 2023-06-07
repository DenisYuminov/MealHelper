//
//  RecipeCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

protocol IRecipeCoordinator: AnyObject {
    func createFlow(recipeId: Int) -> UIViewController
}

final class RecipeCoordinator: IRecipeCoordinator, RecipePresenterOutput {    
    // Dependencies
    private let moduleBuilder: IRecipeModuleBuilder
    private let createRecipeCoordinator: ICreateRecipeCoordinator
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: IRecipeModuleBuilder, createRecipeCoordinator: ICreateRecipeCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.createRecipeCoordinator = createRecipeCoordinator
    }
    
    // MARK: IRecipeCoordinator
    
    func createFlow(recipeId: Int) -> UIViewController {
        let viewController = moduleBuilder.build(output: self, recipeId: recipeId)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: RecipePresenterOutput
    
    func onEditButtonClicked(_ recipeId: Int) {
        let viewController = createRecipeCoordinator.createFlow(recipeId: recipeId)
        transitionHandler?.navigationController?.pushViewController(viewController, animated: true)
    }
}
