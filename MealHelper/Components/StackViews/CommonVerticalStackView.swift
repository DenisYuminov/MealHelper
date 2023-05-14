//
//  CommonVerticalStackView.swift
//  MealHelper
//
//  Created by macbook Denis on 5/4/23.
//

import UIKit

final class CommonVerticalStackView: UIStackView {
    init(views: [UIView]) {
        super.init(frame: .zero)
        spacing = 20
        axis = .vertical
        addArrangedSubviews(views)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
