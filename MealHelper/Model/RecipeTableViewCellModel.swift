//
//  RecipeTableViewCellModel.swift.swift
//  MealHelper
//
//  Created by macbook Denis on 6/1/23.
//

import Foundation

struct RecipeCellModel: Codable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case isLiked = "is_liked"
    }
}

struct RecipeTableViewCellModel: Codable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let isLiked: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case isLiked = "is_liked"
    }
}
