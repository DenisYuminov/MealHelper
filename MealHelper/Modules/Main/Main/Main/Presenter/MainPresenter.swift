//
//  MainPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    func onRecipeCellClicked(recipe: Int)
    func onSeeAllButtonClicked(category: Section)
}

final class MainPresenter {
    // Dependencies
    weak var view: MainViewInput?
    private let output: MainPresenterOutput?
    private let mainService: IMainService
    
    // Properties
    var dataSource: [[RecipeTableViewCellModel]] = []
    
    // MARK: Init
    
    init(output: MainPresenterOutput?, mainService: IMainService) {
        self.output = output
        self.mainService = mainService
    }
    
    // MARK: Private
    
    private func getData() {
        mainService.getData { [weak self] result in
            switch result {
            case .success(let categoryData):
                let categories = ["popular", "new", "easy"]
                for category in categories {
                    if let recipes = categoryData[category] {
                        let viewModels = recipes.map { recipeCellResponse in
                            return RecipeTableViewCellModel(
                                id: recipeCellResponse.id,
                                title: recipeCellResponse.title,
                                description: recipeCellResponse.description,
                                image: recipeCellResponse.image,
                                isLiked: recipeCellResponse.isLiked
                            )
                        }
                        self?.dataSource.append(viewModels)
                    }
                }
                self?.view?.reloadData()
            case .failure(let error):
                print("MainPresenter\n", ">>>", "Error: \(error)")
            }
        }
    }
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    func onSeeAllButtonClicked(category: Section) {
        output?.onSeeAllButtonClicked(category: category)
    }
    
    func viewDidLoad() {
        getData()
    }
    
    func onRecipeCellClicked(recipe: Int) {
        output?.onRecipeCellClicked(recipe: recipe)
    }
}
