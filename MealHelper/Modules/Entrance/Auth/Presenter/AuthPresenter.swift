//
//  AuthPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import Foundation

protocol AuthPresenterOutput: AnyObject {
    func openLoginScreen()
    func openCreateAccountScreen()
}

final class AuthPresenter {
    // Dependencies
    weak var view: AuthViewInput?
    private let output: AuthPresenterOutput
    private let authService: IAuthService
    
    // MARK: Init
    
    init(output: AuthPresenterOutput, authService: IAuthService) {
        self.output = output
        self.authService = authService
    }
}

// MARK: - AuthViewOutput

extension AuthPresenter: AuthViewOutput {
    func viewDidLoad() {
        authService.doSomeWork()
    }
    
    func onLoginButtonClicked() {
        output.openLoginScreen()
    }
    
    func onSignupButtonClicked() {
        output.openCreateAccountScreen()
    }
    
    func onContinueButtonClicked() {
    }
}
