//
//  MainPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    func onRecipeCellCkicked(recipe: RecipeModel)
}

final class MainPresenter {
    // Dependencies
    weak var view: MainViewInput?
    private let output: MainPresenterOutput?
    private let mainService: IMainService
    
    // MARK: Init
    
    init(output: MainPresenterOutput?, mainService: IMainService) {
        self.output = output
        self.mainService = mainService
    }
}

extension MainPresenter: MainViewOutput {
    func getData() -> [Category] {
        return [Category]()
    }
    
    func onRecipeCellCkicked(recipe: RecipeModel) {
        output?.onRecipeCellCkicked(recipe: recipe)
    }
}
