//
//  YourRecipesViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

class YourRecipesViewController: UIViewController {
    private let output: YourRecipesViewOutput
    
    // MARK: Init

    init(output: YourRecipesViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}

extension YourRecipesViewController: YourRecipesViewInput {
}
