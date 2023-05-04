//
//  MainViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import UIKit

final class MainViewController: UIViewController {
    // Dependencies
    
    private let output: MainViewOutput
    // UI
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] section, _ in
                guard let self else { fatalError("Self is nil") }
                guard let section = Section(rawValue: section) else {
                    fatalError("This section: (\(section)) does not exist")
                }
                
                switch section {
                case .new:
                    return self.popularCellsSection()
                case .popular:
                    return self.popularCellsSection()
                case .easy:
                    return self.popularCellsSection()
                }
            },
            configuration: configuration
        )
        return UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
    }()

    // MARK: Init

    init(output: MainViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    // Private
    private func setup() {
        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        Section.allCases.forEach {_ in
            collectionView.register(
                UICollectionViewCell.self,
                forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier
            )
        }
        collectionView.register(
            CollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "CollectionReusableView"
        )
        collectionView.register(
            RecipeCollectionViewCell.self,
            forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier)
        
        Section.allCases.forEach {_ in
            collectionView.layer.cornerRadius = 15
            collectionView.backgroundColor = .clear
        }
        collectionView.layer.cornerRadius = 15
        collectionView.layer.masksToBounds = true
        collectionView.layoutIfNeeded()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func popularCellsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.33)
            )
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(320)
            ),
            repeatingSubitem: item,
            count: 3
        )
        let section = NSCollectionLayoutSection(
            group: group
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.05)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        return section
    }
}

// MARK: UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        switch Section(rawValue: section) {
        case .new:
            return 0
        case .popular:
            return 0
        case .easy:
            return 0
        case nil:
            return 0
        }
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError("No found Section") }
        let category = category(for: section)
        let recipe = category.items[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? RecipeCollectionViewCell else {
            fatalError("Unable to dequeue RecipeCollectionViewCell")
            }
            cell.configure(with: recipe)
            
            return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "CollectionReusableView",
                for: indexPath
            ) as? CollectionReusableView else {
                fatalError("Could not dequeue CollectionReusableView")
            }
//            header.configureCell(headerName: MainService().getData()[indexPath.section].title)
            header.button.tag = indexPath.section
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else { fatalError("No found Section") }
        let category = category(for: section)
        let recipe = category.items[indexPath.row]
        output.onRecipeCellCkicked(recipe: recipe)
    }
}

extension MainViewController: MainViewInput {
}
