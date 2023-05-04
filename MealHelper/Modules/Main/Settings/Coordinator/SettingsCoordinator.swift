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
    private weak var authCoordinator: IAuthCoordinator?
    
    // Properties
    private weak var transitionHandler: UINavigationController?
    
    // MARK: Init
    
    init(moduleBuilder: ISettingsModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    // MARK: IMainCoordinator
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        let navigationController = UINavigationController(rootViewController: viewController)
        transitionHandler = navigationController
        return navigationController
    }
    
    func openAuthScreen() {
        guard let viewController = authCoordinator?.createFlow() else { return }
        transitionHandler?.setViewControllers([viewController], animated: true)
    }
}
