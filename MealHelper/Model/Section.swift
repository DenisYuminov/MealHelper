//
//  Section.swift
//  MealHelper
//
//  Created by macbook Denis on 6/1/23.
//

import Foundation

enum Section: Int, CaseIterable {
    case popular
    case new
    case easy
    
    var title: String {
        switch self {
        case .new:
            return L10n.Main.Category.new
        case .popular:
            return L10n.Main.Category.popular
        case .easy:
            return L10n.Main.Category.easy
        }
    }
    
    var tag: String {
        switch self {
        case .new:
            return "new"
        case .easy:
            return "easy"
        case .popular:
            return "popular"
        }
    }
}
