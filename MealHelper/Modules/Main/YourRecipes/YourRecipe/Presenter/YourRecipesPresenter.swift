//
//  YourRecipesPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol YourRecipesPresenterOutput: AnyObject {
    func createRecipeButtonClicked()
    func didSelectRecipe(recipe: RecipeModel)
}

final class YourRecipesPresenter {
    // Dependencies
    weak var view: YourRecipesViewInput?
    private let output: YourRecipesPresenterOutput?
    private let yourRecipesService: IYourRecipesService
    
    // Properties
    var dataSource: [RecipeModel] = []

    // MARK: Init
    
    init(output: YourRecipesPresenterOutput?, yourRecipesService: IYourRecipesService) {
        self.output = output
        self.yourRecipesService = yourRecipesService
    }
    
    // Private
    private func getData() {
        let viewModels = yourRecipesService.yourRecipes()
        self.dataSource += viewModels
        self.view?.reloadData()
    }
}

// MARK: YourRecipesViewOutput

extension YourRecipesPresenter: YourRecipesViewOutput {
    func didSelectRecipe(recipe: RecipeModel) {
        output?.didSelectRecipe(recipe: recipe)
    }
    
    func onCreateRecipeButtonClicked() {
        output?.createRecipeButtonClicked()
    }
    
    func viewDidLoad() {
        getData()
    }
}
