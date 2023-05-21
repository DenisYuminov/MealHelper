//
//  MacronutrientsLabel.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

final class MacronutrientsLabel: UILabel {
    init(title: String) {
        super.init(frame: .zero)
        text = "\(title) "
        backgroundColor = .systemGray5
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor
        textAlignment = .natural
        clipsToBounds = true
        font = UIFont.systemFont(ofSize: 15)
        textInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + textInsets.left + textInsets.right,
            height: size.height + textInsets.top + textInsets.bottom
        )
    }
        
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}
