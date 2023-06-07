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
    
    // Properties
    private var recipe: RecipeModel?
    private var isUserRecipe = false
    var isLike = false

    // UI
    private lazy var recipeStackView = CommonVerticalStackView(views: [])
    private lazy var infoStackView: UIStackView = CommonVerticalStackView(views: [])
    private lazy var infoAndImageStackView: UIStackView = InfoAndImageStackView(views: [])
    private lazy var macronutrientsStackView: UIStackView = MacronutrientsStackView(views: [])
    private lazy var methodStackView: UIStackView = MethodStackView(views: [])
    private lazy var likeStackView: UIStackView = LikeStackView(views: [])
    private lazy var titleLabel: UILabel = TitleLabel(title: recipe?.title ?? "")
    private lazy var imageView: UIImageView = CommonImageView(imageUrl: recipe?.image ?? "")
//    private lazy var creatorLabel: UILabel = {
//        let label = CommonCreateLabel(title: "\(L10n.Recipe.AuthorLabel.title) \(recipe?.creator)")
//        label.numberOfLines = 2
//        return label
//    }()
    private lazy var timeToCookLabel: UILabel = CommonCreateLabel(
        title: "\(L10n.Recipe.CookLabel.title): \( recipe?.timeToPrepare ?? "")"
    )
    private lazy var timeToPreparelabel: UILabel = CommonCreateLabel(
        title: "\(L10n.Recipe.PrepareLabel.title): \( recipe?.timeToCook ?? "")"
    )
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16) 
        textView.text = recipe?.description ?? ""
        textView.isEditable = false
        textView.textColor = UIColor(asset: Asset.Colors.descriptionColor)
        textView.backgroundColor = UIColor(asset: Asset.Colors.logoBackgraundColor)
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        return textView
    }()
    private lazy var ingredientsTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 17)
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
        button.addTarget(self, action: #selector(like), for: .touchUpInside)
        button.setImage(UIImage.heart, for: .normal)
        button.imageView?.tintColor = .red
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    private lazy var kcalLabel = MacronutrientsLabel(title: "\(L10n.Recipe.Kcal.title) \(recipe?.kcal ?? 0)")
    private lazy var fatLabel = MacronutrientsLabel(title: "\(L10n.Recipe.Fat.title) \(recipe?.fat ?? 0)")
    private lazy var saturatesLabel = MacronutrientsLabel(
        title: "\(L10n.Recipe.Saturates.title) \(recipe?.saturates ?? 0)"
    )
    private lazy var proteinLabel = MacronutrientsLabel(
        title: "\(L10n.Recipe.Protein.title) \(recipe?.protein ?? 0)"
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
        output.viewDidLoad()
        view.backgroundColor = UIColor(asset: Asset.Colors.logoBackgraundColor)
        title = titleLabel.text
    }

    // MARK: Private
    
    private func setupMethod() {
        recipe?.methods.enumerated().forEach { index, step in
            addMethodStep(step: step.text, index: index + 1)
        }
    }
    private func setupIngredientsTextView() {
        ingredientsTextView.font = UIFont.systemFont(ofSize: 17)
        
        let ingredientsString = recipe?.ingredients.map { $0.name }.joined(separator: "\n\n") ?? ""
        
        ingredientsTextView.isEditable = false
        ingredientsTextView.backgroundColor = .systemGray5
        ingredientsTextView.isScrollEnabled = false
        ingredientsTextView.showsVerticalScrollIndicator = false
        ingredientsTextView.sizeToFit()
        ingredientsTextView.layer.cornerRadius = 10
        ingredientsTextView.text = ingredientsString
    }
    private func addMethodStep(step: String, index: Int) {
        let stepLabel = UILabel()
        stepLabel.text = "\(L10n.Recipe.Method.step) \(index )"
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
            make.width.height.equalTo(190)
        }
        likeStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(recipeStackView).inset(10)
            make.bottom.equalTo(scrollView).inset(50)
        }
        
        if isUserRecipe {
            let barButtonItem = UIBarButtonItem(
                title: L10n.Recipe.EditButton.title,
                style: .plain,
                target: self,
                action: #selector(buttonTapped(_:)))
            navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    // MARK: Actions
    
    @objc private func buttonTapped(_ sender: UIBarButtonItem) {
        output.editButtonClicked(recipe?.id ?? 0)
    }
    
    @objc private func like() {
        output.like(recipeId: recipe?.id ?? 0)
        if isLike {
            isLike = false
            likeButton.setImage(UIImage.heart, for: .normal)
        } else {
            isLike = true
            likeButton.setImage(UIImage.heartFill, for: .normal)
        }
    }
}

// MARK: RecipeViewInput

extension RecipeViewController: RecipeViewInput {
    func showRecipe(recipe: RecipeModel, isUserRecipe: Bool) {
        self.recipe = recipe
        self.isUserRecipe = isUserRecipe
        title = recipe.title
        titleLabel.text = recipe.title
        imageView.image = UIImage(named: recipe.image )
        timeToCookLabel.text = "\(L10n.Recipe.CookLabel.title): \(recipe.timeToPrepare )"
        timeToPreparelabel.text = "\(L10n.Recipe.PrepareLabel.title): \(recipe.timeToCook )"
        descriptionTextView.text = recipe.description
        kcalLabel.text = "\(L10n.Recipe.Kcal.title) \(recipe.kcal )"
        fatLabel.text = "\(L10n.Recipe.Fat.title) \(recipe.fat )"
        saturatesLabel.text = "\(L10n.Recipe.Saturates.title) \(recipe.saturates )"
        proteinLabel.text = "\(L10n.Recipe.Protein.title) \(recipe.protein )"
        isLike = recipe.isLike
        if isLike {
            likeButton.setImage(UIImage.heartFill, for: .normal)
        } else {
            likeButton.setImage(UIImage.heart, for: .normal)
        }
        setupMethod()
        setupIngredientsTextView()
        setupUI()
    }
}
