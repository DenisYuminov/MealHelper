//
//  LoginModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//
import UIKit

protocol ILoginModuleBuilder: AnyObject {
    func build(output: LoginPresenterOutput?) -> UIViewController
}

final class LoginModuleBuilder: ILoginModuleBuilder {
    // Dependencies
    private let loginService: ILoginService
    
    // MARK: Init
    
    init(loginService: ILoginService) {
        self.loginService = loginService
    }
    
    // MARK: ILoginModuleBuilder
    
    func build(output: LoginPresenterOutput?) -> UIViewController {
        let presenter = LoginPresenter(output: output, loginService: loginService)
        let view = LoginViewController(output: presenter)
        presenter.view = view
        return view
    }
}
