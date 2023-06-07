//
//  SettingsPresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol SettingsPresenterOutput: AnyObject {
    func openAuthScreen()
}

final class SettingsPresenter {
    // Dependencies
    weak var view: SettingsViewInput?
    private let output: SettingsPresenterOutput?
    private let settingService: ISettingsService
    
    // MARK: Init
    
    init(output: SettingsPresenterOutput?, settingService: ISettingsService) {
        self.output = output
        self.settingService = settingService
    }
    
    func getUserInfo() {
        settingService.getUserInfo { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let userInfo):
                    self.view?.displayUserInfo(userInfo: userInfo)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

// MARK: SettingsViewOutput

extension SettingsPresenter: SettingsViewOutput {
    func onLogOutButtonClicked() {
        KeychainService.shared.deleteToken()
        output?.openAuthScreen()
    }
    
    func onsignInButtonClicked() {
        output?.openAuthScreen()
    }
    func viewDidLoad() {
        getUserInfo()
    }
}
