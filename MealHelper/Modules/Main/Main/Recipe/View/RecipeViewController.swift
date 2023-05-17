//
//  RecipeViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

final class RecipeViewController: UIViewController {
    // Dependencies
    private let output: RecipeViewOutput
    
    // UI
    private lazy var recipeStackView = CommonVerticalStackView(views: [])
    private lazy var infoStackView: UIStackView = CommonVerticalStackView(views: [])
    private lazy var infoAndImageStackView: UIStackView = InfoAndImageStackView(views: [])
    private lazy var macronutrientsStackView: UIStackView = MacronutrientsStackView(views: [])
    private lazy var methodStackView: UIStackView = MethodStackView(views: [])
    private lazy var likeStackView: UIStackView = LikeStackView(views: [])
    private lazy var titleLabel: UILabel = TitleLabel(title: output.recipe.title)
    private lazy var imageView: UIImageView = CommonImageView(imageUrl: output.recipe.image)
    private lazy var creatorLabel: UILabel = {
        let label = CommonCreateLabel(title: "\(L10n.Recipe.AuthorLabel.title) \(output.recipe.creator)")
        label.numberOfLines = 2
        return label
    }()
    private lazy var timeToCookLabel: UILabel = CommonCreateLabel(
        title: "\(L10n.Recipe.CookLabel.title): \(output.recipe.timeToPrepare)"
    )
    private lazy var timeToPreparelabel: UILabel = CommonCreateLabel(
        title: "\(L10n.Recipe.PrepareLabel.title): \(output.recipe.timeToCook)"
    )
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16) 
        textView.text = output.recipe.description
        textView.isEditable = false
        textView.textColor = .gray
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    private lazy var ingredientsTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 17)
        let ingredientsString = output.recipe.ingredients.joined(separator: "\n")
        textView.isEditable = false
        textView.backgroundColor = .systemGray5
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        textView.sizeToFit()
        textView.layer.cornerRadius = 10
        textView.text = ingredientsString
        return textView
    }()
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = L10n.Recipe.LikeLabel.title
        label.sizeToFit()
        return label
    }()
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.heart, for: .normal)
        button.imageView?.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    private lazy var kcalLabel = MacronutrientsLabel(title: "\(L10n.Recipe.Kcal.title) \(output.recipe.kcal)")
    private lazy var fatLabel = MacronutrientsLabel(title: "\(L10n.Recipe.Fat.title) \(output.recipe.fat)")
    private lazy var saturatesLabel = MacronutrientsLabel(
        title: "\(L10n.Recipe.Saturates.title) \(output.recipe.saturates)"
    )
    private lazy var proteinLabel = MacronutrientsLabel(
        title: "\(L10n.Recipe.Protein.title) \(output.recipe.protein)"
    )
    private lazy var ingridientTitleLabel: UILabel = TitleLabel(title: L10n.Recipe.Ingridients.title)
    private lazy var methodTitleLabel: UILabel = TitleLabel(title: L10n.Recipe.Method.title)
    private lazy var scrollView = UIScrollView(frame: .zero)
    
    // MARK: Init
    
    init(output: RecipeViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupMethod()
        view.backgroundColor = .systemBackground
        title = titleLabel.text
    }
    
    // MARK: Private
    
    private func setupMethod() {
        output.recipe.method.enumerated().forEach { index, step in
            addMethodStep(step: step, index: index)
        }
    }
    private func addMethodStep(step: String, index: Int) {
        let stepLabel = UILabel()
        stepLabel.text = "\(L10n.Recipe.Method.step) \(index + 1)"
        stepLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        let textView = UITextView()
        textView.text = step
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.layer.cornerRadius = 10
        textView.isEditable = false
        textView.backgroundColor = .systemGray5
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        textView.sizeToFit()
        
        let stepStackView = UIStackView()
        stepStackView.axis = .vertical
        stepStackView.alignment = .leading
        stepStackView.spacing = 8
        stepStackView.addArrangedSubviews([stepLabel, textView])
        
        methodStackView.addArrangedSubview(stepStackView)
    }

    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        recipeStackView.addArrangedSubviews([
            infoAndImageStackView,
            descriptionTextView,
            macronutrientsStackView,
            ingridientTitleLabel,
            ingredientsTextView,
            methodTitleLabel,
            methodStackView,
            likeStackView
        ])
        infoStackView.addArrangedSubviews([
            creatorLabel,
            timeToCookLabel,
            timeToPreparelabel
        ])
        scrollView.addSubview(recipeStackView)

        ingredientsTextView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(recipeStackView).inset(10)
        }
        methodStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(recipeStackView).inset(10)
        }
        recipeStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        infoAndImageStackView.addArrangedSubviews([
            imageView,
            infoStackView
        ])
        macronutrientsStackView.addArrangedSubviews([
            kcalLabel,
            fatLabel,
            saturatesLabel,
            proteinLabel
        ])
        likeStackView.addArrangedSubviews([
            likeLabel,
            likeButton
        ])
        imageView.snp.makeConstraints { make in
            make.width.equalTo(190)
            make.height.equalTo(190)
        }
        likeStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(recipeStackView).inset(10)
            make.bottom.equalTo(scrollView).inset(50)
        }
    }
}

// MARK: RecipeViewInput

extension RecipeViewController: RecipeViewInput {
}
