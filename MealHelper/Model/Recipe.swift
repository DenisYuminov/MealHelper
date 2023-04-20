//
//  Recipe.swift
//  MealHelper
//
//  Created by macbook Denis on 4/17/23.
//

import UIKit

struct Recipe: Decodable, Hashable {
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
}

enum Category: Decodable, Hashable {
    case new([Recipe])
    case popular([Recipe])
    case easy([Recipe])
    
    var items: [Recipe] {
        switch self {
        case .new(let items), .popular(let items), .easy(let items):
            return items
        }
    }
    var count: Int {
        items.count
    }
    var type: String {
        switch self {
        default:
            return "SelfConfiguringCell"
        }
    }
    var title: String {
        switch self {
        case .new(_):
            return "New"
        case .popular(_):
            return "Popular"
        case .easy(_):
            return "Easy"
        }
    }
}
