//
//  MainService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol IMainService: AnyObject {
    func getEasy() -> Category
    func getNew() -> Category
    func getPopular() -> Category
    func getData() -> [Category]
}
final class MainService: IMainService {
    func getPopular() -> Category {
        return Category.popular([RecipeModel]())
    }
    func getNew() -> Category {
        return Category.new([RecipeModel]())
    }
    func getEasy() -> Category {
        return Category.easy([RecipeModel]())
    }
    func getData() -> [Category] {
        return []
    }
}
