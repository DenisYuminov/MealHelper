//
//  CreateRecipeCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import UIKit

protocol ICreateRecipeCoordinator: AnyObject {
    func createFlow(recipeId: Int) -> UIViewController
}

final class CreateRecipeCoordinator: ICreateRecipeCoordinator, CreateRecipePresenterOutput {
    // Dependencies
    private let moduleBuilder: ICreateRecipeModuleBuilder
    
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: ICreateRecipeModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: ICreateRecipeCoordinator
    
    func createFlow(recipeId: Int = 0) -> UIViewController {
        let viewController = moduleBuilder.build(output: self, recipeId: recipeId)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: CreateRecipePresenterOutput

    func showYOurRecipe() {
        transitionHandler?.navigationController?.popToRootViewController(animated: true)
    }
}

extension ICreateRecipeCoordinator {
    func createFlow() -> UIViewController {
        return createFlow(recipeId: 0)
    }
}
