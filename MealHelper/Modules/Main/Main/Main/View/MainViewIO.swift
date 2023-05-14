//
//  MainViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol MainViewInput: AnyObject {
    func reloadData()
}

protocol MainViewOutput: AnyObject {
    var dataSource: [[RecipeModel]] { get }
    func onRecipeCellCkicked(recipe: RecipeModel)
    func viewDidLoad()
    func onSeeAllButtonClicked(category: Section)
}
