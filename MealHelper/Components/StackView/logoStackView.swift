//
//  logoStackView.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

final class LogoStackView: UIStackView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 15
        axis = .vertical
        spacing = 0
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
        self.addArrangedSubviews([LogoLabel(title: "👨🏾‍🌾", size: 150), LogoLabel(title: "Meal Helper", size: 36)])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class LogoLabel: UILabel {
    init(title: String, size: Int) {
        super.init(frame: .zero)
        text = title
        textAlignment = .center
        font = UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
