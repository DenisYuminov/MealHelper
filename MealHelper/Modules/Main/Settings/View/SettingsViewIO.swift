//
//  SettingsViewIO.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol SettingsViewInput: AnyObject {
    func displayUserInfo( userInfo: UserResponse)
}

protocol SettingsViewOutput: AnyObject {
    func onLogOutButtonClicked()
    func onsignInButtonClicked()
    func viewDidLoad()
}
