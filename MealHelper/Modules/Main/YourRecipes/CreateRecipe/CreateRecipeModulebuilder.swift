//
//  CreateRecipeModulebuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import UIKit

protocol ICreateRecipeModuleBuilder: AnyObject {
    func build(output: CreateRecipePresenterOutput) -> UIViewController
}

final class CreateRecipeModulebuilder: ICreateRecipeModuleBuilder {
    // Dependencies
    private let createRecipeService: ICreateRecipeService
    
    // MARK: Init
    
    init(createRecipeService: ICreateRecipeService) {
        self.createRecipeService = createRecipeService
    }
    
    // MARK: ICreateRecipeModuleBuilder
    
    func build(output: CreateRecipePresenterOutput) -> UIViewController {
        let presenter = CreateRecipePresenter(output: output, createRecipeService: createRecipeService)
        let view = CreateRecipeViewController(output: presenter)
        presenter.view = view
        return view
    }
}
