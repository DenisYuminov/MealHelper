//
//  LoginCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

protocol ILoginCoordinator: AnyObject {
    var transitionHandler: UINavigationController? { get set }
    func createFlow() -> UIViewController
}

final class LoginCoordinator: ILoginCoordinator, LoginPresenterOutput {
    // Dependencies
    private let moduleBuilder: ILoginModuleBuilder
    private let forgotPasswordCoordinator: IForgotPasswordCoordinator
    
    // Properties
    var transitionHandler: UINavigationController?
    
    // MARK: Init
    init(moduleBuilder: ILoginModuleBuilder, forgotPasswordCoordinator: IForgotPasswordCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.forgotPasswordCoordinator = forgotPasswordCoordinator
    }
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        return viewController
    }
    
    func openForgotPasswordScreen() {
        let viewController = ForgotPasswordViewController()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
