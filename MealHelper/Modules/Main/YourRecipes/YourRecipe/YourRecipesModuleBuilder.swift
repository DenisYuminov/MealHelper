//
//  YourRecipesModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol IYourRecipesModuleBuilder: AnyObject {
    func build(output: YourRecipesPresenterOutput?) -> UIViewController
}

final class YourRecipesModuleBuilder: IYourRecipesModuleBuilder {
    // Dependencies
    private let yourRecipesService: IYourRecipesService
    
    // MARK: Init
    
    init(yourRecipesService: IYourRecipesService) {
        self.yourRecipesService = yourRecipesService
    }
    
    // MARK: IYourRecipesModuleBuilder
    
    func build(output: YourRecipesPresenterOutput?) -> UIViewController {
        let presenter = YourRecipesPresenter(output: output, yourRecipesService: yourRecipesService)
        let view = YourRecipesViewController(output: presenter)
        view.tabBarItem = .init(
            title: L10n.YourRecipes.Navigation.title,
            image: .init(systemName: "plus"),
            selectedImage: .init(systemName: "plus.fill")
        )
        presenter.view = view
        return view
    }
}
