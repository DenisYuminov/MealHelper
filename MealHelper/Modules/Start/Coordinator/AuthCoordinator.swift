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
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: IAuthModuleBuilder, loginCoordinator: ILoginCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.loginCoordinator = loginCoordinator
    }
    
    // MARK: IAuthCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.transitionHandler = navigationController
        loginCoordinator.transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: AuthPresenterOutput
    
    func openLoginScreen() {
        let viewController = loginCoordinator.createFlow()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
