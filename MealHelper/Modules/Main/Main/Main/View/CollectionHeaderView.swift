//
//  CollectionHeaderView.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

protocol CollectionHeaderViewDelegate: AnyObject {
    func seeAllButtonClicked(inSection section: Int)
}

private extension CGFloat {
    static let collectionHeaderViewFont: CGFloat = 25
}

class CollectionHeaderView: UICollectionReusableView {
    static let reuseIdentifier: String = "CollectionHeaderView"
    weak var delegate: CollectionHeaderViewDelegate?

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: .collectionHeaderViewFont, weight: .bold)
        label.textColor = .black
        return label
    }()
    lazy var button = UIButton(type: .system)
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setConstraint()
    }
    
    // MARK: Private
    private func setupView() {
        backgroundColor = .white
        addSubview(headerLabel)
        
        addSubview(button)
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
    func configureCell(headerName: String) {
        headerLabel.text = headerName
        
        button.setTitle(L10n.Main.SeeAllButton.title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonClicked), for: .touchUpInside)
    }
    private func setConstraint() {
        headerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    @objc private func seeAllButtonClicked(sender: UIButton) {
        delegate?.seeAllButtonClicked(inSection: sender.tag)
    }
}
