//
//  CreateRecipeCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import UIKit

protocol ICreateRecipeCoordinator: AnyObject {
    func createFlow() -> UIViewController
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
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: CreateRecipePresenterOutput

    func showYOurRecipe() {
        transitionHandler?.navigationController?.popToRootViewController(animated: true)
    }
}
