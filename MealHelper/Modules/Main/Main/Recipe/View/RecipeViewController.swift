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
    var recipe: Recipe = Recipe(
        title: "Chicken Al Pastor",
        description: "This chicken pastor features almost-charred pineapple and toasty spicy chicken that incredibly juicy!",
        image: "testImage",
        creator: "SomeBody",
        timeToCook: 25,
        timeToPrepare: 10,
        kcal: 318,
        fat: 13,
        saturates: 6,
        protein: 13,
        ingredients: [
            "1 tbsp olive oil",
            "1 onion, finely chopped",
            "2 garlic cloves, crushed",
            "120g chorizo, diced",
            "2 x 400g cans chopped tomatoes",
            "1 tsp caster sugar",
            "600g fresh gnocchi",
            "125g mozzarella ball, cut into chunks",
            "small bunch of basil, torn",
            "green salad, to serve"
        ],
        method: [
            "Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft. Add the chorizo and fry for 5 mins more.",
            "Stir ¾ of the mozzarella and most of the basil thr"
        ]
    )
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
        container.spacing = 20
        return container
    }()
    private lazy var ingridientsStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .systemGray5
        container.axis = .vertical
        container.layer.cornerRadius = 10
        container.spacing = 10
        return container
    }()
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: recipe.title)
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 2
        return label
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
    private lazy var kcalLabel = MacronutrientsLabel(title: "kcal \(recipe.kcal)")
    private lazy var fatLabel = MacronutrientsLabel(title: "fat \(recipe.fat)")
    private lazy var saturatesLabel = MacronutrientsLabel(title: "saturates \(recipe.saturates)")
    private lazy var proteinLabel = MacronutrientsLabel(title: "protein \(recipe.protein)")
    private lazy var ingridientTitleLabel: UILabel = {
        let label = TitleLabel(title: "Ingridients")
        return label
    }()
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
        recipeStackView.addArrangedSubviews([
            infoAndImageStackView,
            macronutrientsStackView,
            ingridientTitleLabel,
            ingridientsStackView
        ])
        imageView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(120)
        }
        recipeStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        [kcalLabel, fatLabel, saturatesLabel, proteinLabel].forEach { label in
            label.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(30)
            }
        }
        for label in recipe.ingredients {
            let ingridientLabel = IngridentLabel(title: label)
            ingridientsStackView.addArrangedSubview(ingridientLabel)
        }
    }
}

extension RecipeViewController: RecipeViewInput {
}
