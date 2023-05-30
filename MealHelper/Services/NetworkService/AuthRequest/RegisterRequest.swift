//
//  RegisterRequest.swift
//  MealHelper
//
//  Created by macbook Denis on 5/29/23.
//
import Alamofire
import Foundation

struct RegisterParameters: Codable {
    let email: String
    let password: String
    let username: String
    let roleId: Int
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case username
        case roleId = "role_id"
    }
}

enum RegisterError: Error {
    case userAlreadyExists
    case wrongPasswords
    
    var localizedDescription: String {
        switch self {
        case .userAlreadyExists:
            return L10n.CreateAccount.Error.userAlreadyexists
        case .wrongPasswords:
            return L10n.CreateAccount.Error.wrongPassword
        }
    }
    
    var statusCode: Int {
        switch self {
        case .userAlreadyExists:
            return 400
        case .wrongPasswords:
            return 0
        }
    }
}
