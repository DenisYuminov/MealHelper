//
//  LikesViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol LikesViewInput: AnyObject {
    func getRecipes(_ recipes: [RecipeModel])
}

protocol LikesViewOutput: AnyObject {
    func didSelectRecipe(recipe: RecipeModel)
    func viewDidLoad()
}
