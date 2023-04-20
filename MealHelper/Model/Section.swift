//
//  Section.swift
//  MealHelper
//
//  Created by macbook Denis on 4/17/23.
//

import Foundation

enum Section: Int, CaseIterable {
    case new
    case popular
    case easy
}

func category(for section: Section) -> Category {
    let service = MockMainService()
    switch section {
    case .new:
        return service.getNew()
    case .popular:
        return service.getPopular()
    case .easy:
        return service.getEasy()
    }
}
