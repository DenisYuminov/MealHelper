//
//  RecipeCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

protocol IRecipeCoordinator: AnyObject {
    func createFlow() -> UIViewController
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
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        transitionHandler = viewController
        return viewController
    }
}
