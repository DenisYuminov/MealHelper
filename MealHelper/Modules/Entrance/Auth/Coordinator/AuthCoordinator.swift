//
//  AuthCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

protocol IAuthCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class AuthCoordinator: IAuthCoordinator, AuthPresenterOutput {
    // Dependencies
    private let moduleBuilder: IAuthModuleBuilder
    private let loginCoordinator: ILoginCoordinator
    private let createAccountCoordinator: ICreateAccountCoordinator
    private let mainTabBarCoordinator: IMainTabBarCoordinator
    
    // Properties
    private weak var transitionHandler: UIViewController?
    
    // MARK: Init
    
    init(
        moduleBuilder: IAuthModuleBuilder,
        loginCoordinator: ILoginCoordinator,
        createAccountCoordinator: ICreateAccountCoordinator,
        mainTabBarCoordinator: IMainTabBarCoordinator
    ) {
        self.moduleBuilder = moduleBuilder
        self.loginCoordinator = loginCoordinator
        self.createAccountCoordinator = createAccountCoordinator
        self.mainTabBarCoordinator = mainTabBarCoordinator
    }
    
    // MARK: IAuthCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        transitionHandler = viewController
        return viewController
    }
    
    // MARK: AuthPresenterOutput
    
    func openLoginScreen() {
        let viewController = loginCoordinator.createFlow()
        transitionHandler?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func openCreateAccountScreen() {
        let viewController = createAccountCoordinator.createFlow()
        transitionHandler?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func openMainScreen() {
        let viewController = mainTabBarCoordinator.createFlow(isAuth: false)
        transitionHandler?.navigationController?.setViewControllers([viewController], animated: true)
    }
}
