//
//  ForgotPasswordPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import Foundation

protocol ForgotPasswordPresenterOutput: AnyObject {
    func onConfirmButtonClicked()
}

final class ForgotPasswordPresenter {
    // Dependencies
    weak var view: ForgotPasswordViewInput?
    private weak var output: ForgotPasswordPresenterOutput?
    private let forgotPasswordService: IForgotPasswordService
    
    // MARK: Init
    
    init(output: ForgotPasswordPresenterOutput?, forgotPasswordService: IForgotPasswordService) {
        self.output = output
        self.forgotPasswordService = forgotPasswordService
    }
}

extension ForgotPasswordPresenter: ForgotPasswordViewOutput {
    func onConfirmbuttonClicked() {
        output?.onConfirmButtonClicked()
    }
}
