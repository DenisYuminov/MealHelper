//
//  AuthViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//
import Foundation

protocol AuthViewInput: AnyObject {
}

protocol AuthViewOutput: AnyObject {
    func onLoginButtonClicked()
    func onSignupButtonClicked()
    func onContinueButtonClicked()
}
