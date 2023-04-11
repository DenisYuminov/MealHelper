//
//  UIStackView + Extensions.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
