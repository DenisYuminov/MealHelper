//
//  YourRecipesPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol YourRecipesPresenterOutput: AnyObject {
    func createRecipeButtonClicked()
}

final class YourRecipesPresenter {
    // Dependencies
    weak var view: YourRecipesViewInput?
    private let output: YourRecipesPresenterOutput?
    private let yourRecipesService: IYourRecipesService
    
    // MARK: Init
    
    init(output: YourRecipesPresenterOutput?, yourRecipesService: IYourRecipesService) {
        self.output = output
        self.yourRecipesService = yourRecipesService
    }
}

extension YourRecipesPresenter: YourRecipesViewOutput {
    func onCreateRecipeButtonClicked() {
        output?.createRecipeButtonClicked()
    }
}
