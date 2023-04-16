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
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: IYourRecipesModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: IYourRecipesCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
}
