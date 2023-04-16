//
//  SettingsViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

class SettingsViewController: UIViewController {

    // Dependencies
    private let output: SettingsViewOutput
    
    // MARK: Init

    init(output: SettingsViewOutput) {
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

extension SettingsViewController: SettingsViewInput {
}
