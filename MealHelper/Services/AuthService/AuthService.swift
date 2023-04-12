//
//  AuthService.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import Foundation

protocol IAuthService: AnyObject {
    func doSomeWork()
}

final class AuthService: IAuthService {
    func doSomeWork() {
    }
}
