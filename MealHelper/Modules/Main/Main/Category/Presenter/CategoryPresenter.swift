//
//  CategoryPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import Foundation

protocol CategoryPresenterOutput: AnyObject {
    func onRecipeCellClicked(recipe: RecipeModel)
}

final class CategoryPresenter {
    // Dependencies
    weak var view: CategoryViewInput?
    private let output: CategoryPresenterOutput
    private let categoryService: ICategoryService
    
    // Properties
    var dataSource: [RecipeModel] = []
    
    // MARK: Init
    
    init(output: CategoryPresenterOutput, categoryService: ICategoryService) {
        self.output = output
        self.categoryService = categoryService
    }
    
    // MARK: Private
    
    private func getData() {
        let viewModels = categoryService.getCategory()
        self.dataSource += viewModels
        self.view?.reloadData()
    }
}

// MARK: - CategoryViewOutput

extension CategoryPresenter: CategoryViewOutput {
    func onRecipeCellClicked(recipe: RecipeModel) {
        output.onRecipeCellClicked(recipe: recipe)
    }
    
    func viewDidLoad() {
        getData()
    }
}
