//
//  SettingsModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol ISettingsModuleBuilder: AnyObject {
    func build(output: SettingsPresenterOutput?) -> UIViewController
}

final class SettingsModuleBuilder: ISettingsModuleBuilder {
    // Dependencies
    private let settingsService: ISettingsService
    
    // MARK: Init
    
    init(settingsService: ISettingsService) {
        self.settingsService = settingsService
    }
    
    // MARK: ISettingsModuleBuilder
    
    func build(output: SettingsPresenterOutput?) -> UIViewController {
        let presenter = SettingsPresenter(output: output, settingService: settingsService)
        let view = SettingsViewController(output: presenter)
        view.tabBarItem = .init(
            title: L10n.Settings.Navigation.title,
            image: .init(systemName: "gearshape"),
            selectedImage: .init(systemName: "gearshape.fill")
        )
        presenter.view = view
        return view
    }
}
