//
//  LoginViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import Foundation

protocol LoginViewInput: AnyObject {
    func showError(error: LoginError)
}

protocol LoginViewOutput: AnyObject {
    func onSignInButtonClicked(params: LoginParameters)
    func onForgotButtonClicked()
}
