//
//  CreateRecipeViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import Foundation
import UIKit
protocol CreateRecipeViewInput: AnyObject {
    func editRecipe(recipe: RecipeModel)
}

protocol CreateRecipeViewOutput: AnyObject {
    func onCancelRecipeButtonClicked()
    func onSaveRecipeButtonClicked(recipe: RecipeModel, image: UIImage)
    func viewDidLoad()
}
