//
//  CommonHorizontalStackView.swift
//  MealHelper
//
//  Created by macbook Denis on 5/4/23.
//

import UIKit

final class CommonHorizontalStackView: UIStackView {
    init(views: [UIView]) {
        super.init(frame: .zero)
        backgroundColor = .white
        spacing = 120
        addArrangedSubviews(views)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
