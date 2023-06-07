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
        placeholderLabel.frame.origin = CGPoint(x: textContainerInset.left + 5, y: textContainerInset.top + 8)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !self.text.isEmpty
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChange(_:)),
            name: UITextView.textDidChangeNotification,
            object: nil
        )
    }

    @objc func textDidChange(_ notification: Notification) {
        if let placeholderLabel = self.subviews.first(where: { $0 is UILabel }) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }

    func setTextAndHidePlaceholder(_ text: String) {
        self.text = text
        if let placeholderLabel = self.subviews.first(where: { $0 is UILabel }) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }
}
