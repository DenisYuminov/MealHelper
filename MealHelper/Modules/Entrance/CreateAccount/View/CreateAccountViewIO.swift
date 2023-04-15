//
//  CreateAccountViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import Foundation

protocol CreateAccountViewInput: AnyObject {
}

protocol CreateAccountViewOutput: AnyObject {
    func onCreateButtonClicked()
}
