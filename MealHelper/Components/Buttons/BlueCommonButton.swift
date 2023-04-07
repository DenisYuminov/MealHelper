//
//  BlueCommonButton.swift
//  MealHelper
//
//  Created by r.a.gazizov on 07.04.2023.
//

import UIKit

final class BlueCommonButton: UIButton {
    init(title: String?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .blue
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
