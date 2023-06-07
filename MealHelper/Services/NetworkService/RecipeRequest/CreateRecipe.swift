//
//  CreateRecipe.swift
//  MealHelper
//
//  Created by macbook Denis on 6/2/23.
//

import Foundation

struct CreateRecipeResponse: Codable {
    let status: String
    let recipeId: Int
    enum CodingKeys: String, CodingKey {
        case status
        case recipeId = "recipe_id"
    }
}

struct UpdateRecipeResponse: Codable {
    let status: String
    enum CodingKeys: String, CodingKey {
        case status
    }
}
