//
//  YourRecipesViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol YourRecipesViewInput: AnyObject {
}

protocol YourRecipesViewOutput: AnyObject {
    func onCreateRecipeButtonClicked()
    func didSelectRecipe(recipe: RecipeModel)
}
