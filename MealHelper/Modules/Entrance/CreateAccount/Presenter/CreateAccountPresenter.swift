//
//  CreateAccountPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import Foundation

protocol CreateAccountPresenterOutput: AnyObject {
    func onCreateButtonClicked()
}

final class CreateAccountPresenter {
    // Dependencies
    weak var view: CreateAccountViewInput?
    private let output: CreateAccountPresenterOutput?
    private let createAccountService: ICreateAccountService
    
    // MARK: Init
    
    init(output: CreateAccountPresenterOutput?, createAccountService: ICreateAccountService) {
        self.output = output
        self.createAccountService = createAccountService
    }
}

// MARK: CreateAccountViewOutput

extension CreateAccountPresenter: CreateAccountViewOutput {
    func onCreateButtonClicked(params: RegisterParameters) {
        createAccountService.createAccount(parameters: params) { result in
            switch result {
            case .success:
                self.output?.onCreateButtonClicked()
            case .failure(let error):
                if case let NetworkError.statusCode(statusCode) = error {
                    if statusCode == RegisterError.userAlreadyExists.statusCode {
                        self.view?.showError(error: RegisterError.userAlreadyExists)
                    }
                } else {
                    print("Error:", error)
                }
            }
        }
    }
}
