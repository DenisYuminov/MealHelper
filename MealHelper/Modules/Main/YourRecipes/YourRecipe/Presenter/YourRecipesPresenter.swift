//
//  YourRecipesPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol YourRecipesPresenterOutput: AnyObject {
    func createRecipeButtonClicked()
    func didSelectRecipe(recipe: Int)
}

final class YourRecipesPresenter {
    // Dependencies
    weak var view: YourRecipesViewInput?
    private let output: YourRecipesPresenterOutput?
    private let yourRecipesService: IYourRecipesService
    
    // Properties
    var dataSource: [RecipeTableViewCellModel] = []

    // MARK: Init
    
    init(output: YourRecipesPresenterOutput?, yourRecipesService: IYourRecipesService) {
        self.output = output
        self.yourRecipesService = yourRecipesService
    }
    
    // Private
    private func getData() {
        yourRecipesService.yourRecipes { [weak self] result in
            switch result {
            case .success(let recipes):
                let viewModels = recipes.map { recipeCellResponse in
                    return RecipeTableViewCellModel(
                        id: recipeCellResponse.id,
                        title: recipeCellResponse.title,
                        description: recipeCellResponse.description,
                        image: recipeCellResponse.image,
                        isLiked: recipeCellResponse.isLiked
                    )
                }
                
                self?.dataSource = viewModels
                self?.view?.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

// MARK: YourRecipesViewOutput

extension YourRecipesPresenter: YourRecipesViewOutput {
    func didSelectRecipe(recipe: Int) {
        output?.didSelectRecipe(recipe: recipe)
    }
    
    func onCreateRecipeButtonClicked() {
        output?.createRecipeButtonClicked()
    }
    
    func viewDidLoad() {
        getData()
    }
    
    func deleteRecipe(recipeId: Int) {
        guard let token = KeychainService.shared.retrieveToken() else { return }
        yourRecipesService.deleteRecipe(
            parameters: DeleteRecipeParameters(recipeId: recipeId),
            token: token
        ) { result in
            switch result {
            case .success(let value):
                print(value.status)
            case .failure(let error):
                print("Error:", error)
            }
        }
    }
}
