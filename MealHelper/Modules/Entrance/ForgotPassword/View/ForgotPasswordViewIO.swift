//
//  ForgotPasswordViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import Foundation

protocol ForgotPasswordViewInput: AnyObject {
}

protocol ForgotPasswordViewOutput: AnyObject {
    func onConfirmButtonClicked()
}
