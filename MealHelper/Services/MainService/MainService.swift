//
//  MainService.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import Foundation

protocol IMainService: AnyObject {
    func getData(completion: @escaping (Result<[String: [RecipeCellModel]], Error>) -> Void)
}

final class MainService: IMainService {
    let categoryService: ICategoryService
    
    init(categoryService: ICategoryService) {
        self.categoryService = categoryService
    }
    
    func getData(completion: @escaping (Result<[String: [RecipeCellModel]], Error>) -> Void) {
        let token = KeychainService.shared.retrieveToken() ?? ""
        let categories = ["popular", "new", "easy"]
        
        var categoryData: [String: [RecipeCellModel]] = [:]
        let dispatchGroup = DispatchGroup()
        
        for category in categories {
            dispatchGroup.enter()
            let parameters = CategoryParameters(tag: category)
            
            categoryService.getCategory(parameters: parameters, token: token) { result in
                switch result {
                case .success(let recipes):
                    categoryData[category] = recipes
                case .failure(let error):
                    completion(.failure(error))
                    return
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(.success(categoryData))
        }
    }
}
