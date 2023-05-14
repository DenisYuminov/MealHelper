//
//  LoginPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import Foundation

protocol LoginPresenterOutput: AnyObject {
    func openForgotPasswordScreen()
    func openMainTabBar()
}

final class LoginPresenter {
    // Dependencies
    weak var view: LoginViewInput?
    private let output: LoginPresenterOutput
    private let loginService: ILoginService
    
    // MARK: Init
    
    init(output: LoginPresenterOutput, loginService: ILoginService) {
        self.output = output
        self.loginService = loginService
    }
}

// MARK: LoginViewOutput

extension LoginPresenter: LoginViewOutput {
    func onSignInButtonClicked() {
        output.openMainTabBar()
    }
    
    func onForgotButtonClicked() {
        output.openForgotPasswordScreen()
    }
}
