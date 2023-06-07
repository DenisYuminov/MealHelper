//
//  CreateRecipeService.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import Foundation

protocol ICreateRecipeService: AnyObject {
    func createRecipe (
        parameters: RecipeModel,
        token: String,
        completion: @escaping (Result<CreateRecipeResponse, Error>
        ) -> Void
    )
    func updateRecipe(
        parameters: RecipeModel,
        token: String,
        completion: @escaping (Result<UpdateRecipeResponse, Error>
        ) -> Void
    )
}

final class CreateRecipeService: ICreateRecipeService {
    // Dependencies
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func createRecipe(
        parameters: RecipeModel,
        token: String,
        completion: @escaping (Result<CreateRecipeResponse, Error>
        ) -> Void
    ) {
        let url = "http://127.0.0.1:8000/api/v1/recipes/create?token=\(token)"
        
        networkService.request(
            url: url,
            method: .post,
            parameters: parameters
        ) { (result: Result<(CreateRecipeResponse, Int), Error>) in
            switch result {
            case.success(let (response, _)):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func updateRecipe(
        parameters: RecipeModel,
        token: String,
        completion: @escaping (Result<UpdateRecipeResponse, Error>
        ) -> Void
    ) {
        print("ID>>>>>>>>>>>>>>>>", parameters.id)
        let url = "http://127.0.0.1:8000/api/v1/recipes/update/\(parameters.id)?token=\(token)"
        networkService.request(
            url: url,
            method: .put,
            parameters: parameters
        ) { (result: Result<(UpdateRecipeResponse, Int), Error>) in
            switch result {
            case.success(let (response, _)):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
