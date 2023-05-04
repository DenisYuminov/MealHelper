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
class RecipeCollectionViewCell: UICollectionViewCell {
    // Dependencies
    static let reuseIdentifier: String = "RecipeCollectionViewCell"

    // UI
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: .subTitleFont)
        return label
    }()
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: .ratingLabelFont)
        return label
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = .imageViewCornerRadius
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()

    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let innerStackView = UIStackView(arrangedSubviews: [titleLabel, subtitle, ratingLabel])
        innerStackView.axis = .vertical

        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .center
        outerStackView.spacing = .outerStackViewSpacing
        contentView.addSubview(outerStackView)
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
        }
        outerStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //
    
    func configure(with recipe: RecipeModel) {
        titleLabel.text = recipe.title
        subtitle.text = recipe.description
        imageView.image = UIImage(named: "testImage")
    }
}
