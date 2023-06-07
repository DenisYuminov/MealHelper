//
//  SettingsService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Alamofire
import Foundation

protocol ISettingsService: AnyObject {
    func settings()
    func getUserInfo(completion: @escaping (Result<UserResponse, Error>) -> Void)
}

final class SettingsService: ISettingsService {
    // Dependencies
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func settings() {
    }
    
    func getUserInfo(completion: @escaping (Result<UserResponse, Error>) -> Void) {
        let token = KeychainService.shared.retrieveToken() ?? ""
        if !token.isEmpty {
            let userId = KeychainService.shared.getUserId()
            let url = "http://127.0.0.1:8000/api/v1/auth/jwt/user/\(userId)"
            networkService.request(
                url: url,
                method: .get,
                parameters: [:]
            ) { (result: Result<UserResponse, Error>) in
                switch result {
                case .success(let userInfo):
                    completion(.success(userInfo))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
