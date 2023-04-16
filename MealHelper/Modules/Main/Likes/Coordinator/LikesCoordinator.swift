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
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: ILikesModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: ILikesCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
}
