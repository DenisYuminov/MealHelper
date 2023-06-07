//
//  RecipePresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import Foundation

protocol RecipePresenterOutput: AnyObject {
    func onEditButtonClicked(_ recipeId: Int)
}

final class RecipePresenter {
    // Dependencies
    weak var view: RecipeViewInput?
    private let output: RecipePresenterOutput?
    private let recipeService: IRecipeService
    let recipeId: Int
    private var searchTask: DispatchWorkItem?
    
    // MARK: Init
    
    init(output: RecipePresenterOutput?, recipeService: IRecipeService, recipeId: Int) {
        self.output = output
        self.recipeService = recipeService
        self.recipeId = recipeId
    }
    
    private func getRecipe() {
        recipeService.getRecipe(recipeId: recipeId) { [weak self] result in
            switch result {
            case .success(let recipeResponse):
                let recipeModel = RecipeModel(
                    id: recipeResponse.id,
                    title: recipeResponse.title,
                    userId: recipeResponse.userId,
                    description: recipeResponse.description,
                    image: recipeResponse.image,
                    timeToCook: recipeResponse.timeToCook,
                    timeToPrepare: recipeResponse.timeToPrepare,
                    kcal: recipeResponse.kcal,
                    fat: recipeResponse.fat,
                    saturates: recipeResponse.saturates,
                    protein: recipeResponse.protein,
                    tag: recipeResponse.tag,
                    ingredients: recipeResponse.ingredients,
                    methods: recipeResponse.methods,
                    isLike: recipeResponse.isLike
                )
                let isUserRecipe = recipeModel.userId == KeychainService.shared.getUserId()
                DispatchQueue.main.async {
                    self?.view?.showRecipe(recipe: recipeModel, isUserRecipe: isUserRecipe)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

// MARK: RecipeViewOutput

extension RecipePresenter: RecipeViewOutput {
    func viewDidLoad() {
        getRecipe()
    }
    
    func editButtonClicked(_ recipeId: Int) {
        output?.onEditButtonClicked(recipeId)
    }
    
    func like(recipeId: Int) {
        guard let token = KeychainService.shared.retrieveToken() else { return }
        LikeRecipeService.shared.like(
            parameters: DeleteRecipeParameters(recipeId: recipeId),
            token: token
        ) { result in
            switch result {
            case .success(let response):
                print(response.status, response.message)
            case .failure(let error):
                print("like On cell error: \(error)")
            }
        }
    }
}
