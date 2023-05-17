//
//  CategoryCollectionLayoutSection.swift
//  MealHelper
//
//  Created by macbook Denis on 5/17/23.
//

import UIKit

class CategoryCollectionLayoutSection: NSCollectionLayoutSection {
    convenience init(for section: Int) {
        switch Section(rawValue: section) {
        case .popular, .new, .easy:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.33)
                )
            )
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.93),
                    heightDimension: .absolute(320)
                ),
                repeatingSubitem: item,
                count: 3
            )
            self.init(group: group)
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.05)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            orthogonalScrollingBehavior = .groupPaging
            boundarySupplementaryItems = [header]
        default:
            fatalError("This section: (\(section)) does not exist")
        }
    }
}
