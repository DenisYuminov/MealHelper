//
//  CreateImageButton.swift
//  MealHelper
//
//  Created by macbook Denis on 5/14/23.
//

import UIKit
final class CreateImageButton: UIButton {
    init() {
        super.init(frame: .zero)
        setImage(UIImage.photoOnRectangle, for: .normal)
        imageView?.backgroundColor = .systemGray5
        layer.borderWidth = 2
        layer.cornerRadius = 10
        imageView?.tintColor = .white
        clipsToBounds = true
        imageView?.contentMode = .scaleAspectFill
        backgroundColor = .systemGray5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
