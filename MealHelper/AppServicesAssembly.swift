//
//  AppServicesAssembly.swift
//  MealHelper
//
//  Created by r.a.gazizov on 06.04.2023.
//

import Foundation

protocol IAppServicesAssembly: AnyObject {
    var authService: IAuthService { get }
}

final class AppServicesAssembly: IAppServicesAssembly {
    var authService: IAuthService {
        AuthService()
    }
}
