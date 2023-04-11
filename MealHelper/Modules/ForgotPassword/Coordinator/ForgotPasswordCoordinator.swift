//
//  ForgotPasswordCoordinator.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//
import UIKit

protocol IForgotPasswordCoordinator: AnyObject {
    var transitionHandler: UINavigationController? { get set }
    func createFlow() -> UIViewController
}

final class ForgotPasswordCoordinator: IForgotPasswordCoordinator, ForgotPasswordPresenterOutput {
    // Dependencies
    private let moduleBuilder: IForgotPasswordModuleBuilder
    // Properties
    var transitionHandler: UINavigationController?
    
    // MARK: Init
    init(moduleBuilder: IForgotPasswordModuleBuilder) {
        self.moduleBuilder = moduleBuilder
    }
    
    func createFlow() -> UIViewController {
        let viewController = moduleBuilder.build(output: self)
        return viewController
    }
    
    // MARK: ForgotPasswordPresenterOutput

    func onConfirmButtonClicked() {
        transitionHandler?.popViewController(animated: true)
    }
}
