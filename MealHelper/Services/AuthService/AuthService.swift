//
//  AuthService.swift
//  MealHelper
//
//  Created by r.a.gazizov on 06.04.2023.
//

import Foundation

protocol IAuthService: AnyObject {
    func doSomeWork()
}

final class AuthService: IAuthService {
    func doSomeWork() {
    }
}
