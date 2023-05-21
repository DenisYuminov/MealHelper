//
//  InfoAndImageStackView.swift
//  MealHelper
//
//  Created by macbook Denis on 5/14/23.
//

import UIKit

final class InfoAndImageStackView: UIStackView {
    init(views: [UIView]) {
        super.init(frame: .zero)
        backgroundColor = .clear
        spacing = 20
        addArrangedSubviews(views)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
