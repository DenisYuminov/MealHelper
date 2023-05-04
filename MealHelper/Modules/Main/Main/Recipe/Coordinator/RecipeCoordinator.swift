//
//  RecipeCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

protocol IRecipeCoordinator: AnyObject {
    func createFlow(recipe: RecipeModel) -> UIViewController
}

final class RecipeCoordinator: IRecipeCoordinator, RecipePresenterOutput {
    // Dependencies
    private let moduleBuilder: IRecipeModuleBuilder
    
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: IRecipeModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: IRecipeCoordinator
    
    func createFlow(recipe: RecipeModel) -> UIViewController {
        let viewController = moduleBuilder.build(output: self, recipe: recipe)
        transitionHandler = viewController
        return viewController
    }
}
