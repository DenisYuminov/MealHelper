//
//  CreateRecipeViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 5/3/23.
//

import UIKit

private extension CGFloat {
    static let horizontalStackViewSpacing: CGFloat = 20
    static let imageStackViewSpacing: CGFloat = 100
    static let contentStackView: CGFloat = 50
}

class CreateRecipeViewController: UIViewController {
    // Dependencies
    private let output: CreateRecipeViewOutput
    
    // UI
    private lazy var titleTextField = CommonCreateTextField(title: L10n.CreateRecipe.Title.TextField.placeholder)
    private lazy var titleLabel = CommonCreateLabel(title: L10n.CreateRecipe.Title.TextField.title)
    private lazy var imageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.photoOnRectangle, for: .normal)
        button.imageView?.backgroundColor = .systemGray5
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.imageView?.tintColor = .white
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = .systemGray5
        return button
    }()
    private lazy var imageLabel = CommonCreateLabel(title: L10n.CreateRecipe.Image.title)
    private lazy var timetoprepareLabel = CommonCreateLabel(title: L10n.CreateRecipe.TimeToPrepare.TextField.title)
    private lazy var timetoprepareTextfield = CommonCreateTextField(
        title: L10n.CreateRecipe.TimeToPrepare.TextField.placeholder
    )
    private lazy var timetoCookLabel = CommonCreateLabel(title: L10n.CreateRecipe.TimeToCook.TextField.title)
    private lazy var timetoCookTextfield = CommonCreateTextField(
        title: L10n.CreateRecipe.TimeToCook.TextField.placeholder
    )
    private lazy var tagLabel = CommonCreateLabel(title: L10n.CreateRecipe.TagLabel.title)
    private lazy var tagButton = BlueCommonButton(title: L10n.CreateRecipe.TagButton.title)
    private lazy var tagTextField = GrayCommonTextField(title: L10n.CreateRecipe.TagTextField.placeholder)
    private lazy var descriptionLabel = CommonCreateLabel(title: L10n.CreateRecipe.Desription.Label.title)
    private lazy var descriptionTextView = CommonGrayTextView(title: L10n.CreateRecipe.Desription.TextField.placeholder)
    private lazy var caloriesLabel = CommonCreateLabel(title: L10n.CreateRecipe.CaloriesLabel.title)
    private lazy var fatsLabel = CommonCreateLabel(title: L10n.CreateRecipe.FatLabel.title)
    private lazy var proteinsLabel = CommonCreateLabel(title: L10n.CreateRecipe.ProteinLabel.title)
    private lazy var saturatesLabel = CommonCreateLabel(title: L10n.CreateRecipe.SaturatesLabel.title)
    private lazy var caloriesTextField = CommonCreateTextField(title: L10n.CreateRecipe.CaloriesTextField.placeholder)
    private lazy var proteinsTextField = CommonCreateTextField(title: L10n.CreateRecipe.ProteinsTextField.placeholder)
    private lazy var saturatesTextField = CommonCreateTextField(title: L10n.CreateRecipe.SaturatesTextField.placeholder)
    private lazy var fatsTextField = CommonCreateTextField(title: L10n.CreateRecipe.FatsTextField.placeholder)
    private lazy var ingredientsLabel = CommonCreateLabel(title: L10n.CreateRecipe.IngredientsLabel.title)
    private lazy var addIngredientsButton = BlueCommonButton(title: L10n.CreateRecipe.AddIngredientsButton.title)
    private lazy var ingridientTextView = CommonGrayTextView(title: L10n.CreateRecipe.IngridientTextView.placeholder)
    private lazy var methodLabel = CommonCreateLabel(title: L10n.CreateRecipe.MethodLabel.title)
    private lazy var addMethodButton = BlueCommonButton(title: L10n.CreateRecipe.AddMethodButton.title)
    private lazy var methodTextView = CommonGrayTextView(title: L10n.CreateRecipe.MethodTextView.placeholder)
    private lazy var privateLabel = CommonCreateLabel(title: L10n.CreateRecipe.PrivateLabel.title)
    private lazy var toggleButton: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        return toggle
    }()
    private lazy var saveButton: UIButton = {
        let button = BlueCommonButton(title: L10n.CreateRecipe.SaveButton.title)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var scrollView = UIScrollView(frame: .zero)

    // MARK: Init

    init(output: CreateRecipeViewOutput) {
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
        view.addSubview(scrollView)
        setupStackViews()
        setup()
    }
    
    // Private
    private func setupStackViews() {
        lazy var titleStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [titleLabel, titleTextField])
            stackView.spacing = .horizontalStackViewSpacing
            return stackView
        }()
        lazy var imageStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [imageLabel, imageButton])
            stackView.spacing = .imageStackViewSpacing
            return stackView
        }()
        lazy var timeToPrepareStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [timetoprepareLabel, timetoprepareTextfield])
            stackView.spacing = .horizontalStackViewSpacing
            return stackView
        }()
        lazy var timeToCookStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [timetoCookLabel, timetoCookTextfield])
            stackView.spacing = .horizontalStackViewSpacing
            return stackView
        }()
        lazy var tagHstackView = CommonHorizontalStackView(views: [tagLabel, tagButton])
        lazy var tagVstackView = CommonVerticalStackVIew(views: [tagHstackView, tagTextField])
        lazy var descriptionStackView = CommonVerticalStackVIew(views: [descriptionLabel, descriptionTextView])
        lazy var caloriesStackView = CommonHorizontalStackView(views: [caloriesLabel, caloriesTextField])
        lazy var proteinsStackView = CommonHorizontalStackView(views: [proteinsLabel, proteinsTextField])
        lazy var fatsStackView = CommonHorizontalStackView(views: [fatsLabel, fatsTextField])
        lazy var saturatesStackView = CommonHorizontalStackView(views: [saturatesLabel, saturatesTextField])
        lazy var elementsStackView = CommonVerticalStackVIew(views: [
            caloriesStackView,
            proteinsStackView,
            fatsStackView,
            saturatesStackView
        ])
        lazy var ingridientHStackView = CommonHorizontalStackView(views: [ingredientsLabel, addIngredientsButton])
        lazy var ingridientStackView = CommonVerticalStackVIew(views: [ingridientHStackView, ingridientTextView])
        lazy var methodHStackView = CommonHorizontalStackView(views: [methodLabel, addMethodButton])
        lazy var methodStackView = CommonVerticalStackVIew(views: [methodHStackView, methodTextView])
        lazy var privateStackView = CommonHorizontalStackView(views: [privateLabel, toggleButton])
        lazy var contentStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = .contentStackView
            stackView.axis = .vertical
            stackView.alignment = .center
            return stackView
        }()
        
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubviews([
            titleStackView,
            imageStackView,
            timeToPrepareStackView,
            timeToCookStackView,
            tagVstackView,
            descriptionStackView,
            elementsStackView,
            ingridientStackView,
            methodStackView,
            privateStackView,
            saveButton
        ])
        [caloriesStackView, proteinsStackView, fatsStackView, saturatesStackView].forEach { stackview in
            stackview.spacing = 10
        }
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        [descriptionStackView, ingridientStackView, methodStackView].forEach { stackView in
            stackView.snp.makeConstraints { make in
                make.width.equalToSuperview().multipliedBy(0.9)
            }
        }
    }
    
    private func setup() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        let cancelButton = UIBarButtonItem(
            title: L10n.CreateRecipe.CancelButton.title,
            style: .plain,
            target: self,
            action: #selector(cancelButtonTapped)
        )
        cancelButton.tintColor = .red
        navigationItem.leftBarButtonItem = cancelButton
        
        [caloriesTextField, proteinsTextField, fatsTextField, saturatesTextField].forEach { textfield in
            textfield.textAlignment = .right
        }
        imageButton.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }
        tagTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        [tagButton, addIngredientsButton, addMethodButton].forEach { button in
            button.snp.makeConstraints { make in
                make.width.equalTo(120)
            }
        }
        descriptionTextView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        ingridientTextView.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        methodTextView.snp.makeConstraints { make in
            make.height.equalTo(300)
        }
        saveButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    // MARK: Actions

    @objc private func cancelButtonTapped() {
        output.onCancelRecipeButtonClicked()
    }

    @objc private func saveButtonTapped() {
        output.onSaveRecipeButtonClicked()
    }
}

extension CreateRecipeViewController: CreateRecipeViewInput {
}
