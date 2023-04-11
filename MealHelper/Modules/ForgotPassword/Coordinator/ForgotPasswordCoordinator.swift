//
//  ForgotPasswordCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import Foundation
import UIKit

protocol IForgotPasswordCoordinator: AnyObject {
    func createFlow() -> UIViewController
}

final class ForgotPasswordCoordinator: IForgotPasswordCoordinator {
    func createFlow() -> UIViewController {
        ForgotPasswordViewController()
    }
}
