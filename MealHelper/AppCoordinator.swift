//
//  AppCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

final class AppCoordinator {
    // Dependencies
    private let authCoordinator: IAuthCoordinator
    
    // MARK: Init
    
    init(appPresentationAssembly: IAppPresentationAssembly) {
        self.authCoordinator = appPresentationAssembly.authCoordinator
    }
    
    // MARK: Internal
    
    func createRootViewController() -> UIViewController {
        authCoordinator.createFlow()
    }
}
