//
//  AppServicesAssembly.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import Foundation

protocol IAppServicesAssembly: AnyObject {
    var authService: IAuthService { get }
    var loginService: ILoginService { get }
    var forgotPasswordService: IForgotPasswordService { get }
    var createAccountService: ICreateAccountService { get }
}

final class AppServicesAssembly: IAppServicesAssembly {
    var authService: IAuthService {
        AuthService()
    }
    
    var loginService: ILoginService {
        LoginService()
    }
    
    var forgotPasswordService: IForgotPasswordService {
        ForgotPasswordService()
    }
    
    var createAccountService: ICreateAccountService {
        CreateAccountService()
    }
}
