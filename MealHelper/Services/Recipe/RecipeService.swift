//
//  RecipeService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import Foundation

protocol IRecipeService: AnyObject {
    func like()
    func rating()
}

final class RecipeService: IRecipeService {
    func like() {
    }
    func rating() {
    }
}
