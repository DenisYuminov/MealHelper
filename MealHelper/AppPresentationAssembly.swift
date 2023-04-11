//
//  AppPresentationAssembly.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import Foundation

protocol IAppPresentationAssembly: AnyObject {
    // Coordinators
    var authCoordinator: IAuthCoordinator { get }
    var loginCoordinator: ILoginCoordinator { get }
    var forgotPasswordCoordinator: IForgotPasswordCoordinator { get }
    // ModuleBuilders
    var startModuleBuilder: IAuthModuleBuilder { get }
    var loginModuleBuilder: ILoginModuleBuilder { get }
    var forgotModuleBuilder: ForgotPasswordModuleBuilder { get }
}

final class AppPresentationAssembly: IAppPresentationAssembly {
    // Dependencies
    private let servicesAssembly: IAppServicesAssembly
    
    // MARK: Init
    
    init(servicesAssembly: IAppServicesAssembly) {
        self.servicesAssembly = servicesAssembly
    }
    
    // MARK: Coordinators
        
    var authCoordinator: IAuthCoordinator {
        AuthCoordinator(moduleBuilder: startModuleBuilder, loginCoordinator: loginCoordinator)
    }
    
    var loginCoordinator: ILoginCoordinator {
        LoginCoordinator(moduleBuilder: loginModuleBuilder, forgotPasswordCoordinator: forgotPasswordCoordinator)
    }
    
    var forgotPasswordCoordinator: IForgotPasswordCoordinator {
        ForgotPasswordCoordinator(moduleBuilder: forgotModuleBuilder)
    }
    

    // MARK: ModuleBuilders
    
    var startModuleBuilder: IAuthModuleBuilder {
        AuthModuleBuilder(authService: servicesAssembly.authService)
    }
    
    var loginModuleBuilder: ILoginModuleBuilder {
        LoginModuleBuilder(loginService: servicesAssembly.loginService)
    }
    var forgotModuleBuilder: ForgotPasswordModuleBuilder {
        ForgotPasswordModuleBuilder(forgotPasswordService: servicesAssembly.forgotPasswordService)
    }
}
