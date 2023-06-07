//
//  RecipeModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

protocol IRecipeModuleBuilder: AnyObject {
    func build(output: RecipePresenterOutput?, recipeId: Int) -> UIViewController
}

final class RecipeModuleBuilder: IRecipeModuleBuilder {
    // Dependencies
    private let recipeService: IRecipeService
    
    // MARK: Init
    
    init(recipeService: IRecipeService) {
        self.recipeService = recipeService
    }
    
    // MARK: IRecipeModuleBuilder
    
    func build(output: RecipePresenterOutput?, recipeId: Int) -> UIViewController {
        let presenter = RecipePresenter(output: output, recipeService: recipeService, recipeId: recipeId)
        let view = RecipeViewController(output: presenter)
        presenter.view = view
        return view
    }
}
