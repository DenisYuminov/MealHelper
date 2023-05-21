//
//  TitleLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

final class TitleLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = title
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 28)
        numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
