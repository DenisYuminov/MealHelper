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
    private weak var output: CreateAccountPresenterOutput?
    private let createAccountService: ICreateAccountService
    // MARK: Init
    
    init(output: CreateAccountPresenterOutput?, createAccountService: ICreateAccountService) {
        self.output = output
        self.createAccountService = createAccountService
    }
}

extension CreateAccountPresenter: CreateAccountViewOutput {
    func onCreateButtonClicked() {
        output?.onCreateButtonClicked()
    }
}
