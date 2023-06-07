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
    var dataSource: [RecipeTableViewCellModel] { get }
    func didSelectRecipe(recipe: Int)
    func viewDidLoad()
}
