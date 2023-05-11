//
//  Notifcation+Extensions.swift
//  MealHelper
//
//  Created by macbook Denis on 5/5/23.
//

import UIKit

extension Notification {
    var keyboardFrame: CGRect? {
        let value = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        return value?.cgRectValue
    }
}
