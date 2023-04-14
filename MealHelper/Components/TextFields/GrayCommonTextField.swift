//
//  GrayCommonTextField.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import UIKit

private extension UIEdgeInsets {
    static let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
}

final class GrayCommonTextField: UITextField {
    init(title: String?) {
        super.init(frame: .zero)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 20)
        layer.borderWidth = 2
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        placeholder = title
        textColor = .black
        backgroundColor = .systemGray5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .padding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .padding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .padding)
    }
}
