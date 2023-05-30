//
//  CreateAccountService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import Foundation

struct RegisterResponse: Codable {
}

protocol ICreateAccountService: AnyObject {
    func createAccount(
        parameters: RegisterParameters,
        completion: @escaping (Result<RegisterResponse, Error>
        ) -> Void
    )
}

final class CreateAccountService: ICreateAccountService {
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func createAccount(
        parameters: RegisterParameters,
        completion: @escaping (Result<RegisterResponse, Error>
        ) -> Void
    ) {
        let url = "http://127.0.0.1:8000/api/v1/auth/register"
        
        networkService.request(
            url: url,
            method: .post,
            parameters: parameters
        ) { (result: Result<(RegisterResponse, Int), Error>) in
            switch result {
            case .success(let (response, _)):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
