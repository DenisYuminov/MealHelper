//
//  SettingsCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol ISettingsCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class SettingsCoordinator: ISettingsCoordinator, SettingsPresenterOutput {
    // Dependencies
    private let moduleBuilder: ISettingsModuleBuilder
    private var authCoordinator: IAuthCoordinator?
    private let authCoordinatorClosure: (() -> IAuthCoordinator)
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(
        moduleBuilder: ISettingsModuleBuilder,
        authCoordinatorClosure: @escaping (() -> IAuthCoordinator)
    ) {
        self.moduleBuilder = moduleBuilder
        self.authCoordinatorClosure = authCoordinatorClosure
    }
    
    // MARK: ISettingsCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    
    // MARK: SettingsPresenterOutput
    
    func openAuthScreen() {
        if authCoordinator == nil {
            authCoordinator = authCoordinatorClosure()
        }
        guard let viewController = authCoordinator?.createFlow() else { return }
        transitionHandler?.tabBarController?.setViewControllers([viewController], animated: true)
    }
}
