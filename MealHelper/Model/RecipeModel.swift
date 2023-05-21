//
//  RecipeModel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/17/23.
//

import UIKit

struct RecipeModel: Decodable, Hashable {
    let title: String
    let description: String
    let image: String
    let creator: String
    let timeToCook: Int
    let timeToPrepare: Int
    let kcal: Int
    let fat: Int
    let saturates: Int
    let protein: Int
    let ingredients: [String]
    let method: [String]
    let tags: [String]
}
