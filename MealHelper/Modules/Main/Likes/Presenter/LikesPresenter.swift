//
//  LikesPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol LikesPresenterOutput: AnyObject {
    func didSelectRecipe(_ recipe: Int)
}

final class LikesPresenter {
    // Dependencies
    weak var view: LikesViewInput?
    private let output: LikesPresenterOutput
    private let likesService: ILikesService
    
    // Properties
    var dataSource: [RecipeTableViewCellModel] = []

    // MARK: Init
    
    init(output: LikesPresenterOutput, likesService: ILikesService) {
        self.output = output
        self.likesService = likesService
    }
    
    // Private
    private func getData() {
        let token = KeychainService.shared.retrieveToken() ?? ""
        if !token.isEmpty {
            likesService.likes { [weak self] result in
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
                    print(">>>>> Error: \(error) ")
                }
            }
        } else {
            likesService
        }
    }
}

// MARK: - LikesViewOutput
extension LikesPresenter: LikesViewOutput {
    func didSelectRecipe(recipe: RecipeTableViewCellModel) {
    }
    
    func viewDidLoad() {
        getData()
    }
    
    func didSelectRecipe(recipe: Int) {
        output.didSelectRecipe(recipe)
    }
}
