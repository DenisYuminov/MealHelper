//
//  YourRecipesService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation
import Alamofire

protocol IYourRecipesService: AnyObject {
    func yourRecipes(
        completion: @escaping (Result<[RecipeCellModel], Error>
        ) -> Void
    )

    func deleteRecipe(
        parameters: DeleteRecipeParameters,
        token: String,
        completion: @escaping (Result<DeleteRecipeResponse, Error>
        ) -> Void
    )
}

final class YourRecipesService: IYourRecipesService {
    // Dependencies
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func yourRecipes(
        completion: @escaping (Result<[RecipeCellModel], Error>
        ) -> Void
    ) {
        let url = "http://127.0.0.1:8000/api/v1/recipes/user_recipes/\(KeychainService.shared.getUserId())"
        
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
    
    func deleteRecipe(
        parameters: DeleteRecipeParameters,
        token: String,
        completion: @escaping (Result<DeleteRecipeResponse, Error>
        ) -> Void
    ) {
        let url = "http://127.0.0.1:8000/api/v1/recipes/delete?token=\(token)"
    
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
