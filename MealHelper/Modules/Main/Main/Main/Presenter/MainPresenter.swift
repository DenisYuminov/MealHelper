//
//  MainPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    func onRecipeCellCkicked(recipe: Recipe)
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
    func onRecipeCellCkicked(recipe: Recipe) {
        output?.onRecipeCellCkicked(recipe: recipe)
    }
}
