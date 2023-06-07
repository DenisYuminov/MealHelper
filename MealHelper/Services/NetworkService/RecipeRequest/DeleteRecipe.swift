//
//  DeleteRecipe.swift
//  MealHelper
//
//  Created by macbook Denis on 6/5/23.
//

import Foundation

struct DeleteRecipeParameters: Codable {
    let recipeId: Int

    enum CodingKeys: String, CodingKey {
        case recipeId = "recipe_id"
    }
}

struct DeleteRecipeResponse: Codable {
    let status: String
    let message: String
    enum CodingKeys: CodingKey {
        case status
        case message
    }
}
