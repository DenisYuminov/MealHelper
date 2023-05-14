//
//  LikesViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol LikesViewInput: AnyObject {
    func reloadData()
}

protocol LikesViewOutput: AnyObject {
    var dataSource: [RecipeModel] { get }
    func didSelectRecipe(recipe: RecipeModel)
    func viewDidLoad()
}
