//
//  CategoryService.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import Foundation

protocol ICategoryService: AnyObject {
    func getCategory() -> [RecipeModel]
}

final class CategoryService: ICategoryService {
    func getCategory() -> [RecipeModel] {
        return [RecipeModel]()
    }
}
