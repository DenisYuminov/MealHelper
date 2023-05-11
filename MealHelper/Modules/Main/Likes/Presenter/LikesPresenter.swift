//
//  LikesPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol LikesPresenterOutput: AnyObject {
    func didSelectRecipe(_ recipe: RecipeModel)
}

final class LikesPresenter {
    // Dependencies
    weak var view: LikesViewInput?
    private let output: LikesPresenterOutput?
    private let likesService: ILikesService
    
    // MARK: Init
    
    init(output: LikesPresenterOutput?, likesService: ILikesService) {
        self.output = output
        self.likesService = likesService
    }
    
}

// MARK: - LikesViewOutput
extension LikesPresenter: LikesViewOutput {
    func viewDidLoad() {
        let recipes = [RecipeModel]()
        view?.getRecipes(recipes)
    }
    
    func didSelectRecipe(recipe: RecipeModel) {
        output?.didSelectRecipe(recipe)
    }
}
