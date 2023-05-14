//
//  RecipeTableViewCell.swift
//  MealHelper
//
//  Created by macbook Denis on 4/28/23.
//

import UIKit

private extension CGFloat {
    static let subtitleLabelFont: CGFloat = 15
    static let imageviewCornerRadius: CGFloat = 10
    static let outerStackViewSpacing: CGFloat = 10
}

final class RecipeTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "RecipeTableViewCell"
    
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
        label.font = UIFont.systemFont(ofSize: .subtitleLabelFont)
        return label
    }()
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .red
        button.setImage(UIImage.heartFill, for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return button
    }()
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = .imageviewCornerRadius
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    private lazy var innerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitle])
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var outerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [myImageView, innerStackView, likeButton])
        stackView.alignment = .center
        stackView.spacing = .outerStackViewSpacing
        return stackView
    }()
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    private func setup() {
        contentView.addSubview(outerStackView)
        
        myImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        outerStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
        }
        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}

extension RecipeTableViewCell {
    struct Model {
        let titleLabel: String
        let subTitle: String
        let imageUrl: String
    }
    
    func configure(with model: RecipeModel) {
        titleLabel.text = model.title
        subtitle.text = model.description
        myImageView.image = UIImage(named: model.image)
    }
}
