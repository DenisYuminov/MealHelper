//
//  RecipePresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import Foundation

protocol RecipePresenterOutput: AnyObject {
}

final class RecipePresenter {
    // Dependencies
    weak var view: RecipeViewInput?
    private let output: RecipePresenterOutput?
    private let recipeService: IRecipeService
    let recipe: RecipeModel
    
    // MARK: Init
    
    init(output: RecipePresenterOutput?, recipeService: IRecipeService, recipe: RecipeModel) {
        self.output = output
        self.recipeService = recipeService
        self.recipe = recipe
    }
}

// MARK: RecipeViewOutput

extension RecipePresenter: RecipeViewOutput {
}
