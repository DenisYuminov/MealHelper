//
//  BlueCommonButton.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

final class BlueCommonButton: UIButton {
    init(title: String?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 15
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
