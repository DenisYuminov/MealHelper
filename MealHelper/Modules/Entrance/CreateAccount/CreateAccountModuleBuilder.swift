//
//  CreateAccountModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

protocol ICreateAccountModuleBuilder: AnyObject {
    func build(output: CreateAccountPresenterOutput?) -> UIViewController
}

final class CreateAccountModuleBuilder: ICreateAccountModuleBuilder {
    // Dependencies
    private let createAccountService: ICreateAccountService
    
    // MARK: Init
    
    init(createAccountService: ICreateAccountService) {
        self.createAccountService = createAccountService
    }
    
    // MARK: ICreateAccountModuleBuilder
    
    func build(output: CreateAccountPresenterOutput?) -> UIViewController {
        let presenter = CreateAccountPresenter(output: output, createAccountService: createAccountService)
        let view = CreateAccountViewController(output: presenter)
        presenter.view = view
        return view
    }
}
