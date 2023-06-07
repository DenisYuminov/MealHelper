//
//  CreateRecipePresenter.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import Foundation
import UIKit
import Alamofire

protocol CreateRecipePresenterOutput: AnyObject {
    func showYOurRecipe()
}

final class CreateRecipePresenter {
    // Dependencies
    weak var view: CreateRecipeViewInput?
    private let output: CreateRecipePresenterOutput?
    private let createRecipeService: ICreateRecipeService
    private let recipeService: IRecipeService
    let recipeId: Int
    
    // MARK: Init
    
    init(
        output: CreateRecipePresenterOutput,
        createRecipeService: ICreateRecipeService,
        recipeService: IRecipeService,
        recipeId: Int = 0
    ) {
        self.output = output
        self.createRecipeService = createRecipeService
        self.recipeId = recipeId
        self.recipeService = recipeService
    }
}

// MARK: CreateRecipeViewOutput

extension CreateRecipePresenter: CreateRecipeViewOutput {
    func onCancelRecipeButtonClicked() {
        output?.showYOurRecipe()
    }
    
    func onSaveRecipeButtonClicked(recipe: RecipeModel, image: UIImage) {
        guard let token = KeychainService.shared.retrieveToken() else { return }
        
        if recipe.id == 0 {
            createRecipeService.createRecipe(parameters: recipe, token: token) { [weak self] result in
                switch result {
                case .success(let recipeModel):
                    let url = "http://127.0.0.1:8000/api/v1/recipes/set_image/\(recipeModel.recipeId)"
                    
                    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                        print("Failed to convert the image to data")
                        return
                    }
                    
                    let fileName = "image_\(UUID().uuidString).jpg"
                    
                    AF.upload(
                        multipartFormData: { multipartFormData in
                            multipartFormData.append(
                                imageData,
                                withName: "file",
                                fileName: fileName,
                                mimeType: "image/jpeg"
                            )
                        },
                        to: url
                    )
                    .response { response in
                        switch response.result {
                        case .success(_):
                            print("Image uploaded successfully")
                            self?.output?.showYOurRecipe()
                        case .failure(let error):
                            print("Failed to upload image: \(error)")
                        }
                    }
                    
                case .failure(let error):
                    print("Error creating recipe: \(error)")
                }
            }
        } else {
            createRecipeService.updateRecipe(parameters: recipe, token: token) { [weak self] result in
                switch result {
                case .success(_):
                    print("<<<< update")
                    self?.output?.showYOurRecipe()
                    let url = "http://127.0.0.1:8000/api/v1/recipes/set_image/\(recipe.id)"

                    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                        print("Failed to convert the image to data")
                        return
                    }

                    let fileName = "image_\(UUID().uuidString).jpg"

                    AF.upload(
                        multipartFormData: { multipartFormData in
                            multipartFormData.append(
                                imageData,
                                withName: "file",
                                fileName: fileName,
                                mimeType: "image/jpeg"
                            )
                        },
                        to: url
                    )
                    .response { response in
                        switch response.result {
                        case .success(_):
                            print("Image uploaded successfully")
                            self?.output?.showYOurRecipe()
                        case .failure(let error):
                            print("Failed to upload image: \(error)")
                        }
                    }
                    
                case .failure(let error):
                    print("Error updating recipe: \(error)")
                }
            }
        }
    }
    
    private func showRecipe(recipeId: Int) {
        recipeService.getRecipe(recipeId: recipeId) { result in
            switch result {
            case .success(let recipe):
                DispatchQueue.main.async {
                    self.view?.editRecipe(recipe: recipe)
                }
            case .failure(let error):
                print("Error fetching recipe: \(error)")
            }
        }
    }
    
    func viewDidLoad() {
        if recipeId != 0 {
            showRecipe(recipeId: recipeId)
        }
    }
}
