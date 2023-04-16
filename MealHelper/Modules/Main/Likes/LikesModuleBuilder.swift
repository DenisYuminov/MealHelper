//
//  LikesModuleBuilder.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

protocol ILikesModuleBuilder: AnyObject {
    func build(output: LikesPresenterOutput?) -> UIViewController
}

final class LikesModuleBuilder: ILikesModuleBuilder {
    // Dependencies
    private let likesService: ILikesService
    
    // MARK: Init
    
    init(likesService: ILikesService) {
        self.likesService = likesService
    }
    
    // MARK: ILikesModuleBuilder
    
    func build(output: LikesPresenterOutput?) -> UIViewController {
        let presenter = LikesPresenter(output: output, likesService: likesService)
        let view = LikesViewController(output: presenter)
        view.tabBarItem = .init(
            title: L10n.Likes.Navigation.title,
            image: .init(systemName: "heart"),
            selectedImage: .init(systemName: "heart.fill")
        )
        presenter.view = view
        return view
    }
}
