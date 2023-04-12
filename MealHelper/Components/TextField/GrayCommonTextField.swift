//
//  GrayCommonTextField.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import UIKit

final class GrayCommonTextField: UITextField {
    init(title: String?) {
        super.init(frame: .zero)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 20)
        layer.borderWidth = 2
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        placeholder = title
        textColor = .black
        tintColor = .systemGray6
        backgroundColor = .systemGray5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
