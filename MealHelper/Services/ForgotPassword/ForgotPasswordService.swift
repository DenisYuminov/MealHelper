//
//  ForgotPasswordService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//
import Foundation

protocol IForgotPasswordService: AnyObject {
    func sendNewPassword()
}

final class ForgotPasswordService: IForgotPasswordService {
    func sendNewPassword() {
    }
}
