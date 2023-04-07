//
//  StartCoordinator.swift
//  MealHelper
//
//  Created by r.a.gazizov on 06.04.2023.
//

import UIKit

protocol IStartCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class StartCoordinator: IStartCoordinator, StartPresenterOutput {
    // Dependencies
    private let moduleBuilder: IStartModuleBuilder
    private let loginCoordinator: ILoginCoordinator
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: IStartModuleBuilder, loginCoordinator: ILoginCoordinator) {
        self.moduleBuilder = moduleBuilder
        self.loginCoordinator = loginCoordinator
    }
    
    // MARK: IStartCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: StartPresenterOutput
    
    func openLoginScreen() {
        let viewController = loginCoordinator.createFlow()
        transitionHandler?.pushViewController(viewController, animated: true)
    }
}
