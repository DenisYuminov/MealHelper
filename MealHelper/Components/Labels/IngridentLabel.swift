//
//  IngridentLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

final class IngridentLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = title
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
