//
//  MainPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    func onRecipeCellClicked(recipe: RecipeModel)
    func onSeeAllButtonClicked(category: Section)
}

final class MainPresenter {
    // Dependencies
    weak var view: MainViewInput?
    private let output: MainPresenterOutput?
    private let mainService: IMainService
    
    // Properties
    var dataSource: [[RecipeModel]] = []

    // MARK: Init
    
    init(output: MainPresenterOutput?, mainService: IMainService) {
        self.output = output
        self.mainService = mainService
    }
    
    // MARK: Private
    private func getData() {
        let viewModels = mainService.getData()
        self.dataSource += viewModels
        self.view?.reloadData()
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
    
    func onRecipeCellCkicked(recipe: RecipeModel) {
        output?.onRecipeCellClicked(recipe: recipe)
    }
}
