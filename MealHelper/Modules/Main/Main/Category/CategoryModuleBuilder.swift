//
//  CategoryModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import UIKit

protocol ICategoryModuleBuilder: AnyObject {
    func build(output: CategoryPresenterOutput, category: Section) -> UIViewController
}

final class CategoryModuleBuilder: ICategoryModuleBuilder {
    // Dependencies
    private let categoryService: ICategoryService
    
    // MARK: Init
    
    init(categoryService: ICategoryService) {
        self.categoryService = categoryService
    }
    
    // MARK: ICategoryModuleBuilder
    
    func build(output: CategoryPresenterOutput, category: Section) -> UIViewController {
        let presenter = CategoryPresenter(output: output, categoryService: categoryService)
        let view = CategoryViewController(output: presenter, category: category)
        presenter.view = view
        return view
    }
}
