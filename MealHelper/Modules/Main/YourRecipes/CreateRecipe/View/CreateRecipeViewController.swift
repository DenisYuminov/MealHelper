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

final class CreateRecipeViewController: UIViewController {
    // Dependencies
    private let output: CreateRecipeViewOutput
    
    // Properties
    private var ingredientTextViews: [UITextView] = []
    private var methodTextViews: [UITextView] = []
    private var selectedImage: UIImage?
    private var methodStepCount: Int = 0
    private var recipeId = 0
    private var imageUrl = ""
    
    // UI
    private lazy var ingredintContentStackView = CommonVerticalStackView(views: [ingredientHStackView])
    private lazy var ingredientHStackView = CommonHorizontalStackView(views: [ingredientsLabel, addIngredientsButton])
    private lazy var methodHStackView = CommonHorizontalStackView(views: [methodLabel, addMethodButton])
    private lazy var methodStackView = CommonVerticalStackView(views: [methodHStackView])
    private lazy var privateStackView = CommonHorizontalStackView(views: [privateLabel, toggleButton])
    private lazy var tagHstackView = CommonHorizontalStackView(views: [tagLabel, tagButton])
    private lazy var tagVstackView = CommonVerticalStackView(views: [tagHstackView, tagTextField])
    private lazy var descriptionStackView = CommonVerticalStackView(views: [descriptionLabel, descriptionTextView])
    private lazy var caloriesStackView = CommonHorizontalStackView(views: [caloriesLabel, caloriesTextField])
    private lazy var proteinsStackView = CommonHorizontalStackView(views: [proteinsLabel, proteinsTextField])
    private lazy var fatsStackView = CommonHorizontalStackView(views: [fatsLabel, fatsTextField])
    private lazy var saturatesStackView = CommonHorizontalStackView(views: [saturatesLabel, saturatesTextField])
    private lazy var titleStackView: UIStackView = InfoAndImageStackView(views: [titleLabel, titleTextField])
    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageLabel, image])
        stackView.spacing = .imageStackViewSpacing
        return stackView
    }()
    private lazy var timeToPrepareStackView = InfoAndImageStackView(views: [timetoprepareLabel, prepareTextfield])
    private lazy var timeToCookStackView = InfoAndImageStackView(views: [timetoCookLabel, cookTextfield])
    private lazy var titleTextField = CommonCreateTextField(title: L10n.CreateRecipe.Title.TextField.placeholder)
    private lazy var titleLabel = CommonCreateLabel(title: L10n.CreateRecipe.Title.TextField.title)
    private lazy var imageLabel = CommonCreateLabel(title: L10n.CreateRecipe.Image.title)
    private lazy var timetoprepareLabel = CommonCreateLabel(title: L10n.CreateRecipe.Prepare.TextField.title)
    private lazy var prepareTextfield = CommonCreateTextField(title: L10n.CreateRecipe.Prepare.TextField.placeholder)
    private lazy var timetoCookLabel = CommonCreateLabel(title: L10n.CreateRecipe.Cook.TextField.title)
    private lazy var cookTextfield = CommonCreateTextField(title: L10n.CreateRecipe.Cook.TextField.placeholder)
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
//    private lazy var ingridientTextView = CommonGrayTextView(title: L10n.CreateRecipe.IngridientTextView.placeholder)
    private lazy var methodLabel = CommonCreateLabel(title: L10n.CreateRecipe.MethodLabel.title)
    private lazy var addMethodButton = BlueCommonButton(title: L10n.CreateRecipe.AddMethodButton.title)
    private lazy var methodTextView = CommonGrayTextView(title: L10n.CreateRecipe.MethodTextView.placeholder)
    private lazy var privateLabel = CommonCreateLabel(title: L10n.CreateRecipe.PrivateLabel.title)
    private lazy var toggleButton: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        return toggle
    }()
    private lazy var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: L10n.CreateRecipe.CancelButton.title,
            style: .plain,
            target: self,
            action: #selector(cancelButtonTapped)
        )
        button.tintColor = .red
        return button
    }()
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 10
        image.tintColor = .white
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemGray5
        return image
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
        view.backgroundColor = UIColor(asset: Asset.Colors.logoBackgraundColor)
        view.addSubview(scrollView)
        setup()
        addKeyboardObservers()
        tapgasture()
        output.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectedImage = UIImage(asset: Asset.Images.testImage)
    }
    
    // MARK: Actions
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardFrame = notification.keyboardFrame {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }

    @objc private func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func cancelButtonTapped() {
        output.onCancelRecipeButtonClicked()
    }

    @objc private func saveButtonTapped() {
        guard let title = titleTextField.text else { return }
        guard let timeToCook = cookTextfield.text else { return }
        guard let prepare = prepareTextfield.text else { return }
        guard let description = descriptionTextView.text else { return }
        guard let kcalText = caloriesTextField.text, let kcal = Int(kcalText) else { return }
        guard let proteinsText = proteinsTextField.text, let proteins = Int(proteinsText) else { return }
        guard let fatText = fatsTextField.text, let fat = Int(fatText) else { return }
        guard let saturatesText = saturatesTextField.text, let saturates = Int(saturatesText) else { return }
        guard let tag = tagTextField.text else { return }
        var ingredients: [Ingredient] = []
        for ingredient in ingredientTextViews {
            if ingredient.text.isEmpty { continue }
            ingredients.append(Ingredient(name: ingredient.text))
        }
        var methods: [Method] = []
        for method in methodTextViews {
            if method.text.isEmpty { continue }
            methods.append(Method(text: method.text))
        }
        let recipe = RecipeModel(
            id: recipeId,
            title: title,
            userId: KeychainService.shared.getUserId(),
            description: description,
            image: imageUrl,
            timeToCook: timeToCook,
            timeToPrepare: prepare,
            kcal: kcal,
            fat: fat,
            saturates: saturates,
            protein: proteins,
            tag: tag,
            ingredients: ingredients,
            methods: methods,
            isLike: false
        )
        let recipeImage = selectedImage ?? UIImage(asset: Asset.Images.testImage)!
    
        output.onSaveRecipeButtonClicked( recipe: recipe, image: recipeImage)
    }
    
    @objc private func onAddIngredientClicked() {
        setupIngredient(edit: false)
        scrollView.scrollToView(methodLabel, animated: true)
    }
    
    @objc private func deleteButtonClicked(_ sender: UIButton) {
        guard let index = ingredientTextViews.firstIndex(where: { $0 === sender.superview?.subviews.first }) else {
            return
        }
        sender.superview?.removeFromSuperview()
        ingredientTextViews.remove(at: index)
    }
    
    @objc private func onAddMethodClicked() {
        setupMethod(edit: false)
        scrollView.scrollToView(privateStackView, animated: true)
    }
    
    @objc private func deleteMethodButtonClicked(_ sender: UIButton) {
        guard let methodStackView = sender.superview?.superview as? UIStackView else {
            return
        }
        
        methodStackView.removeFromSuperview()
        
        if let index = methodStackView.arrangedSubviews.firstIndex(
            where: { $0 is UIStackView && $0 !== methodStackView }
        ) {
            methodStackView.arrangedSubviews[index].removeFromSuperview()
            methodTextViews.remove(at: index)
        }
        updateStepLabels()
    }

    @objc func imageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: CreateRecipeViewInput

extension CreateRecipeViewController: CreateRecipeViewInput {
    func editRecipe(recipe: RecipeModel) {
        recipeId = recipe.id
        titleTextField.text = recipe.title
        
        imageUrl = recipe.image
        selectedImage = UIImage(named: recipe.image)
        image.image = UIImage(named: recipe.image)
        tagTextField.text = recipe.tag
        prepareTextfield.text = recipe.timeToPrepare
        cookTextfield.text = recipe.timeToCook
        descriptionTextView.text = recipe.description
        caloriesTextField.text = "\(recipe.kcal)"
        proteinsTextField.text = "\(recipe.protein)"
        fatsTextField.text = "\(recipe.fat)"
        saturatesTextField.text = "\(recipe.saturates)"
        
        for ingredient in recipe.ingredients {
            setupIngredient(edit: true, ingredient: ingredient)
        }
        for methodStep in recipe.methods {
            setupMethod(edit: true, method: methodStep)
        }
    }
}

// MARK: Extension ScrollVIew

extension UIScrollView {
    func scrollToView(_ view: UIView, animated: Bool) {
        let rect = view.convert(view.bounds, to: self)
        self.scrollRectToVisible(rect, animated: animated)
    }
}

// MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension CreateRecipeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [
            UIImagePickerController.InfoKey : Any
        ]
    ) {
        selectedImage = info[.originalImage] as? UIImage
        image.image = selectedImage
        dismiss(animated: true)
    }
}

// MARK: Private

extension CreateRecipeViewController {
    private func setupIngredient(edit: Bool, ingredient: Ingredient = Ingredient(name: "")) {
        let ingredientTextView = CommonGrayTextView(title: L10n.CreateRecipe.IngridientTextView.placeholder)
        if edit {
            ingredientTextView.text = ingredient.name
        }
        let deleteButton = TextViewButton(action: deleteButtonClicked(_:))
        
        let ingredientStackView = UIStackView(arrangedSubviews: [ingredientTextView, deleteButton])
        ingredientStackView.axis = .horizontal
        ingredientStackView.distribution = .fill
        ingredientStackView.spacing = 8
        
        ingredientTextViews.append(ingredientTextView)
        
        ingredintContentStackView.addArrangedSubview(ingredientStackView)
        
        ingredientStackView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    private func setupMethod(edit: Bool, method: Method = Method(text: "")) {
        let methodTextView = CommonGrayTextView(title: L10n.CreateRecipe.MethodTextView.placeholder)
        if edit {
            methodTextView.text = method.text
        }
        let stepLabel = MethodStepLabel(title: "\(L10n.Recipe.Method.step) \(methodStepCount + 1)")
        let deleteButton = TextViewButton(action: deleteMethodButtonClicked(_:))
        
        let methodHorizontalStack = UIStackView(arrangedSubviews: [stepLabel, deleteButton])
        methodHorizontalStack.axis = .horizontal
        methodHorizontalStack.spacing = .horizontalStackViewSpacing
        
        let methodStack = UIStackView(arrangedSubviews: [methodHorizontalStack, methodTextView])
        methodStack.axis = .vertical
        methodStack.spacing = 8

        methodTextViews.append(methodTextView)
        
        methodStackView.addArrangedSubview(methodStack)
        
        methodStack.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalToSuperview()
        }
        updateStepLabels()
    }
    
    private func updateStepLabels() {
        for (index, arrangedSubview) in methodStackView.arrangedSubviews.enumerated() {
            if let methodStack = arrangedSubview as? UIStackView,
                let methodHorizontalStack = methodStack.arrangedSubviews.first as? UIStackView,
                let stepLabel = methodHorizontalStack.arrangedSubviews.first as? UILabel {
                stepLabel.text = "\(L10n.Recipe.Method.step) \(index)"
            }
        }
    }
        
    private func setup() {
        navigationItem.leftBarButtonItem = cancelButton
        
        addIngredientsButton.addTarget(self, action: #selector(onAddIngredientClicked), for: .touchUpInside)
        addMethodButton.addTarget(self, action: #selector(onAddMethodClicked), for: .touchUpInside)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        let elementsStackView = CommonVerticalStackView(views: [
            caloriesStackView,
            proteinsStackView,
            fatsStackView,
            saturatesStackView
        ])
        let contentStackView: UIStackView = {
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
            ingredintContentStackView,
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
        [descriptionStackView, ingredintContentStackView, methodStackView].forEach { stackView in
            stackView.snp.makeConstraints { make in
                make.width.equalToSuperview().multipliedBy(0.9)
            }
        }
        [caloriesTextField, proteinsTextField, fatsTextField, saturatesTextField].forEach { textfield in
            textfield.textAlignment = .right
            textfield.keyboardType = .numberPad
        }
        image.snp.makeConstraints { make in
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
        ingredintContentStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        methodTextView.snp.makeConstraints { make in
            make.height.equalTo(300)
        }
        saveButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
        }
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func tapgasture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
    }
}
