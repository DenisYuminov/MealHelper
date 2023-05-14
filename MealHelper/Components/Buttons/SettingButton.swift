//
//  SettingButton.swift
//  MealHelper
//
//  Created by macbook Denis on 5/14/23.
//

import UIKit

final class SettingButton: UIButton {
    init(title: String?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 15
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
