//
//  LoginViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import Foundation

protocol LoginViewInput: AnyObject {
}

protocol LoginViewOutput: AnyObject {
    func onSignInButtonClicked()
    func onForgotButtonClicked()
}
