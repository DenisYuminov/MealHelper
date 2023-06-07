//
//  CategoryService.swift
//  MealHelper
//
//  Created by macbook Denis on 5/13/23.
//

import Foundation

protocol ICategoryService: AnyObject {
    func getCategory(
        parameters: CategoryParameters,
        token: String,
        completion: @escaping (Result<[RecipeCellModel], Error>
        ) -> Void
    )
}

final class CategoryService: ICategoryService {
    // Dependencies
    private let networkService: INetworkService
    
    init(networkService: INetworkService = NetworkService.shared) {
        self.networkService = networkService
    }
    
    func getCategory(
        parameters: CategoryParameters,
        token: String,
        completion: @escaping (Result<[RecipeCellModel], Error>) -> Void
    ) {
        var url = ""
        if token.isEmpty {
            url = "http://127.0.0.1:8000/api/v1/recipes/recipes/category/without-token"
        } else {
            url = "http://127.0.0.1:8000/api/v1/recipes/recipes/category?token=\(token)"
        }
        networkService.request(
            url: url,
            method: .get,
            parameters: parameters.parametrs
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
