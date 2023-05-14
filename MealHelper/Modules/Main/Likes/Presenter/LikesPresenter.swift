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
    
    // Properties
    var dataSource: [RecipeModel] = []

    // MARK: Init
    
    init(output: LikesPresenterOutput?, likesService: ILikesService) {
        self.output = output
        self.likesService = likesService
    }
    
    // Private
    private func getData() {
        let viewModels = likesService.likes()
        self.dataSource += viewModels
        self.view?.reloadData()
    }
}

// MARK: - LikesViewOutput
extension LikesPresenter: LikesViewOutput {
    func viewDidLoad() {
        getData()
    }
    
    func didSelectRecipe(recipe: RecipeModel) {
        output?.didSelectRecipe(recipe)
    }
}
