//
//  LogoLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

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
