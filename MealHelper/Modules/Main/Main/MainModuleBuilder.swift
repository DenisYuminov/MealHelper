//
//  MainModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol IMainModuleBuilder: AnyObject {
    func build(output: MainPresenterOutput?) -> UIViewController
}

final class MainModuleBuilder: IMainModuleBuilder {
    // Dependencies
    private let mainService: IMainService
    
    // MARK: Init
    
    init(mainService: IMainService) {
        self.mainService = mainService
    }
    
    // MARK: IMainModuleBuilder
    
    func build(output: MainPresenterOutput?) -> UIViewController {
        let presenter = MainPresenter(output: output, mainService: mainService)
        let view = MainViewController(output: presenter)
        view.tabBarItem = .init(
            title: "Main",
            image: .init(systemName: "fork.knife.circle"),
            selectedImage: .init(systemName: "fork.knife.circle.fill")
        )
        presenter.view = view
        return view
    }
}
