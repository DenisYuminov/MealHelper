//
//  TextFieldLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 5/11/23.
//

import UIKit

final class TextFieldLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = title
        textAlignment = .natural
        font = UIFont.systemFont(ofSize: 17)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
