//
//  RecipeViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import Foundation

protocol RecipeViewInput: AnyObject {
    func showRecipe(recipe: RecipeModel, isUserRecipe: Bool)
}

protocol RecipeViewOutput: AnyObject {
    func viewDidLoad()
    func editButtonClicked(_ recipeId: Int)
    func like(recipeId: Int)
}
