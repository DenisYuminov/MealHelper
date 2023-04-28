//
//  MethodLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/26/23.
//

import UIKit

final class MethodLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = title
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 20)
        numberOfLines = 0
        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
