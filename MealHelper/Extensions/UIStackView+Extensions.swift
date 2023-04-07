//
//  UIStackView+Extensions.swift
//  MealHelper
//
//  Created by  on 06.04.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
