//
//  MethodStackView.swift
//  MealHelper
//
//  Created by macbook Denis on 5/14/23.
//

import UIKit

final class MethodStackView: UIStackView {
    init(views: [UIView]) {
        super.init(frame: .zero)
        backgroundColor = .clear
        axis = .vertical
        spacing = 10
        addArrangedSubviews(views)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
