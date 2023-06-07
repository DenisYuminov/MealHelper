//
//  CreateRecipeModulebuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import UIKit

protocol ICreateRecipeModuleBuilder: AnyObject {
    func build(output: CreateRecipePresenterOutput, recipeId: Int) -> UIViewController
}

final class CreateRecipeModulebuilder: ICreateRecipeModuleBuilder {
    // Dependencies
    private let createRecipeService: ICreateRecipeService
    private let recipeService: IRecipeService
    // MARK: Init
    
    init(createRecipeService: ICreateRecipeService, recipeService: IRecipeService) {
        self.createRecipeService = createRecipeService
        self.recipeService = recipeService
    }
    
    // MARK: ICreateRecipeModuleBuilder
    
    func build(output: CreateRecipePresenterOutput, recipeId: Int) -> UIViewController {
        let presenter = CreateRecipePresenter(
            output: output,
            createRecipeService: createRecipeService,
            recipeService: recipeService,
            recipeId: recipeId)
        let view = CreateRecipeViewController(output: presenter)
        presenter.view = view
        return view
    }
}
