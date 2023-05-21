//
//  CreateRecipeViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import Foundation
protocol CreateRecipeViewInput: AnyObject {
}

protocol CreateRecipeViewOutput: AnyObject {
    func onCancelRecipeButtonClicked()
    func onSaveRecipeButtonClicked()
}
