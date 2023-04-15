//
//  CreateAccountCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

protocol ICreateAccountCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class CreateAccountCoordinator: ICreateAccountCoordinator, CreateAccountPresenterOutput {
    // Dependencies
    private let moduleBuilder: ICreateAccountModuleBuilder
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: ICreateAccountModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: ICreateAccountCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: CreateAccountPresenterOutput

    func onCreateButtonClicked() {
    }
}
