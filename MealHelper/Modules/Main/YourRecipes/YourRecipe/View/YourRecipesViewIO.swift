//
//  YourRecipesViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol YourRecipesViewInput: AnyObject {
    func reloadData()
    func showAlert(for indexPath: IndexPath, completion: @escaping () -> Void)
}

protocol YourRecipesViewOutput: AnyObject {
    var dataSource: [RecipeTableViewCellModel] { get set }
    func onCreateRecipeButtonClicked()
    func didSelectRecipe(recipe: Int)
    func deleteRecipe(recipeId: Int)
    func viewDidLoad()
}
