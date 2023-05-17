//
//  CommonGrayTextView.swift
//  MealHelper
//
//  Created by macbook Denis on 5/4/23.
//

import UIKit

final class CommonGrayTextView: UITextView {
    private let placeholderLabel = UILabel()

    init(title: String) {
        super.init(frame: .zero, textContainer: nil)
        backgroundColor = .systemGray5
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemGray5.cgColor
        font = UIFont.systemFont(ofSize: 16)
        textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        addPlaceholder(title)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChange(_:)),
            name: UITextView.textDidChangeNotification,
            object: self
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func textDidChange(_ notification: Notification) {
        self.textViewDidChange(self)
    }
}
