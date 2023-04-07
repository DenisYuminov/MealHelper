//
//  AppPresentationAssembly.swift
//  MealHelper
//
//  Created by r.a.gazizov on 06.04.2023.
//

import Foundation

protocol IAppPresentationAssembly: AnyObject {
    // Coordinators
    var startCoordinator: IStartCoordinator { get }
    var loginCoordinator: ILoginCoordinator { get }
    // ModuleBuilders
    var startModuleBuilder: IStartModuleBuilder { get }
}

final class AppPresentationAssembly: IAppPresentationAssembly {
    // Dependencies
    private let servicesAssembly: IAppServicesAssembly
    
    // MARK: Init
    
    init(servicesAssembly: IAppServicesAssembly) {
        self.servicesAssembly = servicesAssembly
    }
    
    // MARK: Coordinators
    
    var startCoordinator: IStartCoordinator {
        StartCoordinator(moduleBuilder: startModuleBuilder, loginCoordinator: loginCoordinator)
    }
    
    var loginCoordinator: ILoginCoordinator {
        LoginCoordinator()
    }
    
    // MARK: ModuleBuilders
    
    var startModuleBuilder: IStartModuleBuilder {
        StartModuleBuilder(authService: servicesAssembly.authService)
    }
}
