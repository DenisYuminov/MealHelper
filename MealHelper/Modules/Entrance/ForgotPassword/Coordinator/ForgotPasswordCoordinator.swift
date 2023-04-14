//
//  ForgotPasswordCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import UIKit

protocol IForgotPasswordCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class ForgotPasswordCoordinator: IForgotPasswordCoordinator, ForgotPasswordPresenterOutput {
    // Dependencies
    private let moduleBuilder: IForgotPasswordModuleBuilder
    
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: IForgotPasswordModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: IForgotPasswordCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: ForgotPasswordPresenterOutput
    
    func onConfirmButtonClicked() {
        transitionHandler?.navigationController?.popViewController(animated: true)
    }
}
