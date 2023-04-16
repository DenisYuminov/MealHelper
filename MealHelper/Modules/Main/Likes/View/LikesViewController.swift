//
//  LikesViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

class LikesViewController: UIViewController {
    private let output: LikesViewOutput
    
    // MARK: Init

    init(output: LikesViewOutput) {
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

extension LikesViewController: LikesViewInput {
}
