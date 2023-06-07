//
//  CategoryPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import Foundation

protocol CategoryPresenterOutput: AnyObject {
    func onRecipeCellClicked(recipeId: Int)
}

final class CategoryPresenter {
    // Dependencies
    weak var view: CategoryViewInput?
    private let output: CategoryPresenterOutput
    private let categoryService: ICategoryService
    
    // Properties
    var dataSource: [RecipeTableViewCellModel] = []
    var category: Section
    
    // MARK: Init
    
    init(
        output: CategoryPresenterOutput,
        categoryService: ICategoryService,
        category: Section
    ) {
        self.output = output
        self.categoryService = categoryService
        self.category = category
    }
    
    // MARK: Private
    
    private func getData() {
        let token = KeychainService.shared.retrieveToken() ?? ""
        categoryService.getCategory(
            parameters: CategoryParameters(tag: category.tag),
            token: token
        ) { [weak self] result in
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

// MARK: - CategoryViewOutput

extension CategoryPresenter: CategoryViewOutput {
    func onRecipeCellClicked(recipeId: Int) {
        output.onRecipeCellClicked(recipeId: recipeId)
    }

    func viewDidLoad() {
        getData()
    }
}
