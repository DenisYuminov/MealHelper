//
//  LikeRecipeService.swift
//  MealHelper
//
//  Created by macbook Denis on 6/5/23.
//

import Foundation

protocol ILikeRecipeService: AnyObject {
    func like(
        parameters: DeleteRecipeParameters,
        token: String,
        completion: @escaping (Result<DeleteRecipeResponse, Error>
        ) -> Void
    )
}

final class LikeRecipeService: ILikeRecipeService {
    static let shared: LikeRecipeService = .init()
    
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }

    func like(
        parameters: DeleteRecipeParameters,
        token: String,
        completion: @escaping (Result<DeleteRecipeResponse, Error>
        ) -> Void
    ) {
        let url = "http://127.0.0.1:8000/api/v1/recipes/like?token=\(token)"
        networkService.request(
            url: url,
            method: .post,
            parameters: parameters
        ) { (result: Result<(DeleteRecipeResponse, Int), Error>) in
            switch result {
            case .success(let (response, _)):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
