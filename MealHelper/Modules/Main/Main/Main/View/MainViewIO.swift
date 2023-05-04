//
//  MainViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol MainViewInput: AnyObject {
}

protocol MainViewOutput: AnyObject {
    func onRecipeCellCkicked(recipe: RecipeModel)
    func getData() -> [Category]
}
