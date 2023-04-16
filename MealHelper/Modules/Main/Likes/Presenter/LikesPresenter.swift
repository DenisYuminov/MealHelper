//
//  LikesPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol LikesPresenterOutput: AnyObject {
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

extension LikesPresenter: LikesViewOutput {
}
