//
//  CreateRecipePresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import Foundation

protocol CreateRecipePresenterOutput: AnyObject {
    func showYOurRecipe()
}

final class CreateRecipePresenter {
    // Dependencies
    weak var view: CreateRecipeViewInput?
    private let output: CreateRecipePresenterOutput?
    private let createRecipeService: ICreateRecipeService
    
    // MARK: Init
    
    init(output: CreateRecipePresenterOutput, createRecipeService: ICreateRecipeService) {
        self.output = output
        self.createRecipeService = createRecipeService
    }
}

// MARK: RecipeTableViewCell

extension CreateRecipePresenter: CreateRecipeViewOutput {
    func onCancelRecipeButtonClicked() {
        output?.showYOurRecipe()
    }
    
    func onSaveRecipeButtonClicked() {
        output?.showYOurRecipe()
    }
}
