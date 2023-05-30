//
//  LoginService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token
    }
}

protocol ILoginService: AnyObject {
    func login(
        parameters: LoginParameters, completion: @escaping (Result<LoginResponse, Error>) -> Void
    )
}

final class LoginService: ILoginService {
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func login(parameters: LoginParameters, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let url = "http://127.0.0.1:8000/api/v1/auth/jwt/login"
        
        networkService.request(
            url: url,
            method: .post,
            parameters: parameters
        ) { (result: Result<(LoginResponse, Int), Error>) in
            switch result {
            case .success(let (response, _)):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
