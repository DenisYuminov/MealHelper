//
//  UITextView+Extensions.swift
//  MealHelper
//
//  Created by macbook Denis on 5/11/23.
//

import UIKit

extension UITextView {
    func addPlaceholder(_ placeholder: String) {
        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholder
        placeholderLabel.font = self.font
        placeholderLabel.sizeToFit()
        self.addSubview(placeholderLabel)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !self.text.isEmpty
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.subviews.first(where: { $0 is UILabel }) as? UILabel {
            placeholderLabel.isHidden = !textView.text.isEmpty
        }
    }
}
