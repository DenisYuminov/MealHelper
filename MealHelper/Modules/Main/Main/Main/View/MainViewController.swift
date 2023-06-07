//
//  MainViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/11/23.
//

import UIKit

private extension CGFloat {
    static let collectionViewLayerCornerRadius: CGFloat = 15
}

final class MainViewController: UIViewController {
    // Dependencies
    private let output: MainViewOutput
    
    // UI
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] section, _ in
                guard let self = self else { fatalError("Self is nil") }
                return CategoryCollectionLayoutSection(for: section)
            },
            configuration: configuration
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            RecipeCollectionViewCell.self,
            forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier
        )
        collectionView.register(
            CollectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CollectionHeaderView.reuseIdentifier
        )
    
        collectionView.layer.cornerRadius = .collectionViewLayerCornerRadius
        collectionView.backgroundColor = .clear
        collectionView.layer.masksToBounds = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
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
        output.viewDidLoad()
        setup()
    }
    
    // MARK: Private
    
    private func setup() {
        view.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        collectionView.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    // MARK: Actions
    
    @objc private func refreshData() {
        output.viewDidLoad()
        collectionView.refreshControl?.endRefreshing()
    }
}

// MARK: UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        output.dataSource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return 6
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let category = output.dataSource[indexPath.section]
        let recipe = category[indexPath.row]
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
                withReuseIdentifier: CollectionHeaderView.reuseIdentifier,
                for: indexPath
            ) as? CollectionHeaderView else {
                fatalError("Could not dequeue CollectionHeaderView")
            }
            let section = Section.allCases[indexPath.section]
            header.delegate = self
            header.configureCell(headerName: section.title)
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
        let recipe = output.dataSource[indexPath.section][indexPath.row]
        output.onRecipeCellClicked(recipe: recipe.id)
    }
}

// MARK: MainViewInput

extension MainViewController: MainViewInput {
    func reloadData() {
        collectionView.reloadData()
    }
}

// MARK: CollectionHeaderViewDelegate

extension MainViewController: CollectionHeaderViewDelegate {
    func seeAllButtonClicked(inSection section: Int) {
        output.onSeeAllButtonClicked(category: Section.allCases[section])
    }
}
