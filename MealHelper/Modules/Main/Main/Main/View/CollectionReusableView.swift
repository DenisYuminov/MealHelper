//
//  CollectionReusableView.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    let button = UIButton(type: .system)
    
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
    
    func setupView() {
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
        
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonClicked), for: .touchUpInside)
    }
    func setConstraint() {
        headerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    @objc private func seeAllButtonClicked(sender: UIButton) {
        let section = sender.tag
        print("See All button clicked in section \(section)")
    }
}
