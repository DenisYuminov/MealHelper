//
//  MainService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol IMainService: AnyObject {
    func getData() -> [[RecipeModel]]
}
final class MainService: IMainService {
    func getData() -> [[RecipeModel]] {
        return [[RecipeModel]]()
    }
}
