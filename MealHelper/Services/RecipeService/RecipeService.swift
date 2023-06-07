//
//  RecipeService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import Foundation

protocol IRecipeService: AnyObject {
    func like()
    func rating()
    func getRecipe(
        recipeId: Int,
        completion: @escaping (Result<RecipeModel, Error>
        ) -> Void
    )
}

final class RecipeService: IRecipeService {
    // Dependencies
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func like() {
    }
    func rating() {
    }
    func getRecipe(
        recipeId: Int,
        completion: @escaping (Result<RecipeModel, Error>
        ) -> Void
    ) {
        var url = ""
        let token = KeychainService.shared.retrieveToken() ?? ""
        if token.isEmpty {
            url = "http://127.0.0.1:8000/api/v1/recipes/without-token/\(recipeId)"
        } else {
            url = "http://127.0.0.1:8000/api/v1/recipes/\(recipeId)?token=\(token)"
        }
        
        networkService.request(
            url: url,
            method: .get,
            parameters: [:]
        ) { (result: Result<RecipeResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
