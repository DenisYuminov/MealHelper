//
//  CategoryViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import Foundation

protocol CategoryViewInput: AnyObject {
    func reloadData()
}

protocol CategoryViewOutput: AnyObject {
    var category: Section { get }
    var dataSource: [RecipeTableViewCellModel] { get }
    func onRecipeCellClicked(recipeId: Int)
    func viewDidLoad()
}
