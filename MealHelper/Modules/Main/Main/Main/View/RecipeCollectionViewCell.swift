//
//  RecipeCollectionViewCell.swift
//  MealHelper
//
//  Created by macbook Denis on 4/17/23.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier: String = "RecipeCollectionViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let innerStackView = UIStackView(arrangedSubviews: [titleLabel, subtitle, ratingLabel])
        innerStackView.axis = .vertical

        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .center
        outerStackView.spacing = 10
        contentView.addSubview(outerStackView)
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
        }
        outerStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
        }
    }

    func configure(with recipe: Recipe) {
        titleLabel.text = recipe.title
        subtitle.text = recipe.description
        imageView.image = UIImage(named: "testImage")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}