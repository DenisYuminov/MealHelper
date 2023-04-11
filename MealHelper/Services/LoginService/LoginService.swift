//
//  LoginService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//
import Foundation

protocol ILoginService: AnyObject {
    func doSomeWork()
}

final class LoginService: ILoginService {
    func doSomeWork() {
    }
}
