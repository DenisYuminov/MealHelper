//
//  NetworkError.swift
//  MealHelper
//
//  Created by macbook Denis on 6/1/23.
//

import Foundation

enum NetworkError: Error {
    case missingStatusCode
    case statusCode(Int)
}
