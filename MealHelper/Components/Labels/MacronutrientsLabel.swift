//
//  MacronutrientsLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

final class MacronutrientsLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = "\(title) g"
        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor
        textAlignment = .center
        clipsToBounds = true
        font = UIFont.systemFont(ofSize: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
