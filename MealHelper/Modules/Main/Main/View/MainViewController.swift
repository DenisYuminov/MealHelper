//
//  MainViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import UIKit

final class MainViewController: UIViewController {
    // Dependencies
    private let output: MainViewOutput
    
    // MARK: Init

    init(output: MainViewOutput) {
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

extension MainViewController: MainViewInput {
}
