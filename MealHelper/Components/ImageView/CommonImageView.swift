//
//  CommonImageView.swift
//  MealHelper
//
//  Created by macbook Denis on 5/14/23.
//

import UIKit

final class CommonImageView: UIImageView {
    init(imageUrl: String) {
        super.init(frame: .zero)
        image = UIImage(named: imageUrl)
        layer.cornerRadius = 10
        clipsToBounds = true
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
