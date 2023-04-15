//
//  ForgotPasswordModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import UIKit

protocol IForgotPasswordModuleBuilder: AnyObject {
    func build(output: ForgotPasswordPresenterOutput?) -> UIViewController
}

final class ForgotPasswordModuleBuilder: IForgotPasswordModuleBuilder {
    // Dependencies
    private let forgotPasswordService: IForgotPasswordService
    
    // MARK: Init
    
    init(forgotPasswordService: IForgotPasswordService) {
        self.forgotPasswordService = forgotPasswordService
    }
    
    // MARK: IForgotPasswordModuleBuilder
    
    func build(output: ForgotPasswordPresenterOutput?) -> UIViewController {
        let presenter = ForgotPasswordPresenter(output: output, forgotPasswordService: forgotPasswordService)
        let view = ForgotPasswordViewController(output: presenter)
        presenter.view = view 
        return view
    }
}
