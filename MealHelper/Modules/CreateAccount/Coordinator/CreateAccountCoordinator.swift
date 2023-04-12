//
//  CreateAccountCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

protocol ICreateAccountCoordinator: AnyObject {
    var transitionHandler: UINavigationController? { get set }
    func createFlow() -> UIViewController
}

final class CreateAccountCoordinator: ICreateAccountCoordinator, CreateAccountPresenterOutput {
    // Dependencies
    private let moduleBuilder: ICreateAccountModuleBuilder
    // Properties
    var transitionHandler: UINavigationController?
    
    // MARK: Init
    init(moduleBuilder: ICreateAccountModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        return viewController
    }
    
    // MARK: CreateAccountPresenterOutput

    func onCreateButtonClicked() {
    }
}
