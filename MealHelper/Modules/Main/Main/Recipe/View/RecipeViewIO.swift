//
//  RecipeViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import Foundation

protocol RecipeViewInput: AnyObject {
}

protocol RecipeViewOutput: AnyObject {
    var recipe: RecipeModel { get }
}
