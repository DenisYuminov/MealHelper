//
//  LikesService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation
import Alamofire

protocol ILikesService: AnyObject {
    func likes(
        completion: @escaping (Result<[RecipeCellModel], Error>
        ) -> Void
    )
}

final class LikesService: ILikesService {
    // Dependencies
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func likes(
        completion: @escaping (Result<[RecipeCellModel], Error>
        ) -> Void
    ) {
        let url = "http://127.0.0.1:8000/api/v1/recipes/user_likes/\(KeychainService.shared.getUserId())"
        
        networkService.request(
            url: url,
            method: .get,
            parameters: [:]
        ) { (result: Result<CategoryResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.recipes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
