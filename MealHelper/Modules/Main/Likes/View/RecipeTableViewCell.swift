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
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: .subtitleLabelFont)
        return label
    }()

    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return button
    }()
    private lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = .imageviewCornerRadius
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() {
        let innerStackView = UIStackView(arrangedSubviews: [titleLabel, subtitle])
        innerStackView.axis = .vertical

        let outerStackView = UIStackView(arrangedSubviews: [imageview, innerStackView, likeButton])
        outerStackView.alignment = .center
        outerStackView.spacing = .outerStackViewSpacing
        contentView.addSubview(outerStackView)
        
        imageview.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        outerStackView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(contentView)
        }
        likeButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
    
    func configureCell(with recipe: RecipeModel) {
        titleLabel.text = recipe.title
        subtitle.text = recipe.description
        imageview.image = UIImage(named: "testImage")
    }
}
