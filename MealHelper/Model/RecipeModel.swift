//
//  RecipeModel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/17/23.
//

import UIKit

struct RecipeModel: Codable {
    let id: Int
    let title: String
    let userId: Int
    let description: String
    let image: String
    let timeToCook: String
    let timeToPrepare: String
    let kcal: Int
    let fat: Int
    let saturates: Int
    let protein: Int
    let tag: String
    let ingredients: [Ingredient]
    let methods: [Method]
    let isLike: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case timeToCook = "time_to_cook"
        case timeToPrepare = "time_to_prepare"
        case userId = "user_id"
        case kcal
        case fat
        case saturates
        case protein
        case tag
        case ingredients
        case methods
        case isLike = "is_like"
    }
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let name: String
    
    enum CodingKeys: CodingKey {
        case name
    }
}

// MARK: - Method
struct Method: Codable {
    let text: String
    enum CodingKeys: CodingKey {
        case text
    }
}
