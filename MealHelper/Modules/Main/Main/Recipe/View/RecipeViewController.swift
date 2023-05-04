//
//  RecipeViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/20/23.
//

import UIKit

class RecipeViewController: UIViewController {
    // Dependencies
    private let output: RecipeViewOutput
    private let recipe: RecipeModel
    // UI
    private lazy var recipeStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.axis = .vertical
        container.spacing = 30
        return container
    }()
    private lazy var infoStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.axis = .vertical
        container.spacing = 10
        return container
    }()
    private lazy var infoAndImageStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.layer.cornerRadius = 10
        container.spacing = 20
        return container
    }()
    private lazy var macronutrientsStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.spacing = 10
        container.distribution = .fillEqually

        return container
    }()
    private lazy var ingridientsStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .systemGray5
        container.axis = .vertical
        container.layer.cornerRadius = 10
        container.spacing = 10
        container.distribution = .fillEqually
        return container
    }()
    private lazy var methodStackView: UIStackView = {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 10
        return container
    }()
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: recipe.title)
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 2
        return label
    }()
    private lazy var likeStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.spacing = 5
        return container
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testImage")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    private lazy var creatorLabel: UILabel = {
        let label = UILabel()
        label.text = "by \(recipe.creator)"
        return label
    }()
    private lazy var timeToCookLabel: UILabel = {
        let label = UILabel()
        label.text = "Cook: \(recipe.timeToPrepare)"
        return label
    }()
    private lazy var timeToPreparelabel: UILabel = {
        let label = UILabel()
        label.text = "Prepare: \(recipe.timeToCook)"
        return label
    }()
    private lazy var descriptionView: UILabel = {
        let textview = UILabel()
        textview.text = recipe.description
        textview.numberOfLines = 0
        textview.textColor = .gray
        return textview
    }()
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Do you like this recipe?"
        return label
    }()
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.imageView?.tintColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        return button
    }()
    private lazy var kcalLabel = MacronutrientsLabel(title: "kcal \(recipe.kcal)")
    private lazy var fatLabel = MacronutrientsLabel(title: "fat \(recipe.fat)")
    private lazy var saturatesLabel = MacronutrientsLabel(title: "saturates \(recipe.saturates)")
    private lazy var proteinLabel = MacronutrientsLabel(title: "protein \(recipe.protein)")
    private lazy var ingridientTitleLabel: UILabel = {
        let label = TitleLabel(title: "Ingridients")
        return label
    }()
    private lazy var methodTitleLabel: UILabel = {
        let label = TitleLabel(title: "Method")
        return label
    }()
    private lazy var scrollView = UIScrollView(frame: .zero)
    // MARK: Init
    init(output: RecipeViewOutput, recipe: RecipeModel) {
        self.output = output
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = titleLabel.text
        view.addSubview(scrollView)
        setupUI()
    }
    
    func setupUI() {
        scrollView.addSubview(recipeStackView)
        infoStackView.addArrangedSubviews([
            creatorLabel,
            timeToCookLabel,
            timeToPreparelabel
        ])
        
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
        recipeStackView.addArrangedSubviews([
            infoAndImageStackView,
            descriptionView,
            macronutrientsStackView,
            ingridientTitleLabel,
            ingridientsStackView,
            methodTitleLabel,
            methodStackView,
            likeStackView
        ])
        imageView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(80)
        }
        recipeStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        [kcalLabel, fatLabel, saturatesLabel, proteinLabel].forEach { label in
            label.snp.makeConstraints { make in
                make.width.equalTo(60)
                make.height.equalTo(30)
            }
        }
        for label in recipe.ingredients {
            let ingridientLabel = IngridentLabel(title: " \(label)")
            ingridientsStackView.addArrangedSubview(ingridientLabel)
        }
        
        for method in recipe.method {
            let methodLabel = MethodLabel(title: method)
            methodStackView.addArrangedSubview(methodLabel)
        }
        
        ingridientsStackView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        methodStackView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        likeStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
}

extension RecipeViewController: RecipeViewInput {
}
