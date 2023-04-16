//
//  LoginCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

protocol ILoginCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class LoginCoordinator: ILoginCoordinator, LoginPresenterOutput {
    // Dependencies
    private let moduleBuilder: ILoginModuleBuilder
    private let forgotPasswordCoordinator: IForgotPasswordCoordinator
    private let mainTabBarCoordinator: IMainTabBarCoordinator
    
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(moduleBuilder: ILoginModuleBuilder,
         forgotPasswordCoordinator: IForgotPasswordCoordinator,
         mainTabBarCoordinator: IMainTabBarCoordinator
    ) {
        self.moduleBuilder = moduleBuilder
        self.forgotPasswordCoordinator = forgotPasswordCoordinator
        self.mainTabBarCoordinator = mainTabBarCoordinator
    }
    
    // MARK: ILoginCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: LoginPresenterOutput
    
    func openForgotPasswordScreen() {
        let viewController = forgotPasswordCoordinator.createFlow()
        transitionHandler?.navigationController?.pushViewController(viewController, animated: true)
    }
    func openMainTabBar() {
        let viewController = mainTabBarCoordinator.createFlow()
        transitionHandler?.navigationController?.setViewControllers([viewController], animated: true)
    }
}
