//
//  YourRecipesViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol YourRecipesViewInput: AnyObject {
    func reloadData()
}

protocol YourRecipesViewOutput: AnyObject {
    var dataSource: [RecipeModel] { get set }
    func onCreateRecipeButtonClicked()
    func didSelectRecipe(recipe: RecipeModel)
    func viewDidLoad()
}
