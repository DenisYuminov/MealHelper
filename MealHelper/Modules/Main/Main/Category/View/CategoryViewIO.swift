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
    var dataSource: [RecipeModel] { get }
    func onRecipeCellClicked(recipe: RecipeModel)
    func viewDidLoad()
}
