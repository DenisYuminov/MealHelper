//
//  LoginRequest.swift
//  MealHelper
//
//  Created by macbook Denis on 5/30/23.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}

struct LoginParameters: Codable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case email = "username"
        case password
    }
}

enum LoginError: Error {
    case wrongAuth
    
    var localizedDescription: String {
        switch self {
        case .wrongAuth:
            return L10n.SignIn.Error.title
        }
    }
    
    var statusCode: Int {
        switch self {
        case .wrongAuth:
            return 401
        }
    }
}
