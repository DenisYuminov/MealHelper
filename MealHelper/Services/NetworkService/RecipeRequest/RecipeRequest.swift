//
//  RecipeRequest.swift
//  MealHelper
//
//  Created by macbook Denis on 6/1/23.
//

import Foundation

struct RecipeParameters: Codable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}

struct RecipeResponse: Codable {
    let data: RecipeModel
}
