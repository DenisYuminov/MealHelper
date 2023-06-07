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
    let keychainService = KeychainService.shared
    
    // MARK: Init
    
    init(output: LoginPresenterOutput, loginService: ILoginService) {
        self.output = output
        self.loginService = loginService
    }
}

// MARK: LoginViewOutput

extension LoginPresenter: LoginViewOutput {
    func onSignInButtonClicked(params: LoginParameters) {
        loginService.login(parameters: params) { result in
            switch result {
            case .success(let value):
                self.keychainService.saveToken(value.token)
                let userId = self.keychainService.getUserId()
                DispatchQueue.main.async {
                    self.output.openMainTabBar()
                }
            case .failure(let error):
                if case let NetworkError.statusCode(statusCode) = error {
                    if statusCode == LoginError.wrongAuth.statusCode {
                        DispatchQueue.main.async {
                            self.view?.showError(error: LoginError.wrongAuth)
                        }
                    }
                } else {
                    print("Error:", error)
                }
            }
        }
    }
    
    func onForgotButtonClicked() {
        output.openForgotPasswordScreen()
    }
}
