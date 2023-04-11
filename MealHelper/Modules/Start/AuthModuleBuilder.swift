//
//  AuthModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//
import UIKit

protocol IAuthModuleBuilder: AnyObject {
    func build(output: AuthPresenterOutput?) -> UIViewController
}

final class AuthModuleBuilder: IAuthModuleBuilder {
    // Dependencies
    private let authService: IAuthService
    
    // MARK: Init
    
    init(authService: IAuthService) {
        self.authService = authService
    }
    
    // MARK: IAuthModuleBuilder
    
    func build(output: AuthPresenterOutput?) -> UIViewController {
        let presenter = AuthPresenter(output: output, authService: authService)
        let view = AuthViewController(output: presenter)
        presenter.view = view
        return view
    }
}
