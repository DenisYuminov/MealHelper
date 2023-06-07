//
//  CategoryRequest.swift
//  MealHelper
//
//  Created by macbook Denis on 6/1/23.
//
import Alamofire
import Foundation

struct CategoryResponse: Codable {
    let recipes: [RecipeCellModel]
}

struct CategoryParameters: Codable {
    let tag: String
    
    enum CodingKeys: String, CodingKey {
        case tag
    }
    
    var parametrs: Parameters {
        return ["tag": tag]
    }
}
