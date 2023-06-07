//
//  TextViewButton.swift
//  MealHelper
//
//  Created by macbook Denis on 6/6/23.
//

import UIKit

final class TextViewButton: UIButton {
    typealias ActionHandler = (UIButton) -> Void
    
    init(action: @escaping ActionHandler) {
        super.init(frame: .zero)
        setImage(UIImage.remove, for: .normal)
        addTarget(self, action: #selector(actionHandler(_:)), for: .touchUpInside)
        
        self.actionHandler = action
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionHandler(_ sender: UIButton) {
        actionHandler?(sender)
    }
    
    private var actionHandler: ActionHandler?
}
