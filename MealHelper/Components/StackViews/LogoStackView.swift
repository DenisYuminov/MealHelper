//
//  LogoStackView.swift
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
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray5.cgColor
        addArrangedSubviews([
            LogoLabel(title: "👨🏾‍🌾", size: 150),
            LogoLabel(title: L10n.Application.name, size: 36)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
