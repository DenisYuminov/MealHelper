//
//  RecipeCollectionViewCell.swift
//  MealHelper
//
//  Created by macbook Denis on 4/17/23.
//

import UIKit

private extension CGFloat {
    static let subTitleFont: CGFloat = 12
    static let imageViewCornerRadius: CGFloat = 10
    static let ratingLabelFont: CGFloat = 15
    static let titleLabelFont: CGFloat = 32
    static let outerStackViewSpacing: CGFloat = 10
}

final class RecipeCollectionViewCell: UICollectionViewCell {
    // Dependencies
    static let reuseIdentifier: String = "RecipeCollectionViewCell"

    // UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: .subTitleFont)
        return label
    }()
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.Recipe.Rating.title
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: .ratingLabelFont)
        return label
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = .imageViewCornerRadius
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    private lazy var innerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitle, ratingLabel])
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var outerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, innerStackView])
        stackView.alignment = .center
        stackView.spacing = .outerStackViewSpacing
        return stackView
    }()
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(outerStackView)
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
        }
        outerStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeCollectionViewCell {
    struct Model {
        let titleLabel: String
        let subTitle: String
        let imageUrl: String
    }
    
    func configure(with model: RecipeModel) {
        titleLabel.text = model.title
        subtitle.text = model.description
        imageView.image = UIImage(named: model.image)
    }
}
