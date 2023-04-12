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
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: IAuthModuleBuilder,
         loginCoordinator: ILoginCoordinator,
         createAccountCoordinator: ICreateAccountCoordinator
    ) {
        self.moduleBuilder = moduleBuilder
        self.loginCoordinator = loginCoordinator
        self.createAccountCoordinator = createAccountCoordinator
    }
    
    // MARK: IAuthCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.transitionHandler = navigationController
        loginCoordinator.transitionHandler = navigationController
        createAccountCoordinator.transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: AuthPresenterOutput
    
    func openLoginScreen() {
        let viewController = loginCoordinator.createFlow()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
    
    func openCreateAccountScreen() {
        let viewController = createAccountCoordinator.createFlow()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
