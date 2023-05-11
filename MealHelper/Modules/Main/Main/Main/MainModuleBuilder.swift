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
            title: L10n.Main.Navigation.title,
            image: UIImage.forkKnifeCircle,
            selectedImage: UIImage.forkKnifeCircleFill
        )
        presenter.view = view
        return view
    }
}
