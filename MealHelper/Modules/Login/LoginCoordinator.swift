//
//  LoginCoordinator.swift
//  MealHelper
//
//  Created by r.a.gazizov on 06.04.2023.
//

import UIKit

protocol ILoginCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class LoginCoordinator: ILoginCoordinator {
    func createFlow() -> UIViewController {
        LoginViewController()
    }
}
