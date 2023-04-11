//
//  LoginPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import Foundation
protocol LoginPresenterOutput: AnyObject {
    func openForgotPasswordScreen()
}

final class LoginPresenter {
    // Dependencies
    weak var view: LoginViewInput?
    private weak var output: LoginPresenterOutput?
    private let loginService: ILoginService
    
    // MARK: Init
    
    init(output: LoginPresenterOutput?, loginService: ILoginService) {
        self.output = output
        self.loginService = loginService
    }
}

extension LoginPresenter: LoginViewOutput {
    func onSignInButtonClicked() {
    }
    
    func onForgotButtonClicked() {
        output?.openForgotPasswordScreen()
    }
}
