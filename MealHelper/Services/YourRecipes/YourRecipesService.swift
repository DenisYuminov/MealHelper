//
//  YourRecipesService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol IYourRecipesService: AnyObject {
    func yourRecipes() -> [RecipeModel]
}

final class YourRecipesService: IYourRecipesService {
    func yourRecipes() -> [RecipeModel] {
        return [RecipeModel]()
    }
}
