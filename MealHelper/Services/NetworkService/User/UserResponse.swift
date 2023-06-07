//
//  UserResponse.swift
//  MealHelper
//
//  Created by macbook Denis on 6/5/23.
//

import Foundation

struct UserResponse: Codable {
    let email: String
    let username: String
    enum CodingKeys: CodingKey {
        case email
        case username
    }
}
