//
//  CreateAccountViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

private extension CGFloat {
    static let buttonStackViewCornerRadius: CGFloat = 10
    static let buttonStackViewSpacing: CGFloat = 25
    static let createAccountStackViewSpacing: CGFloat = 10
    static let createAccountStackViewCornerRadius: CGFloat = 10
    static let contentStackViewSpasing: CGFloat = 50
    static let titleLabelFont: CGFloat = 32
}

final class CreateAccountViewController: UIViewController {
    // Dependencies
    private let output: CreateAccountViewOutput
    
    // UI
    private lazy var logoStackView: UIStackView = {
        let container = LogoStackView()
        return container
    }()
    private lazy var createAccountStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.layer.cornerRadius = .createAccountStackViewCornerRadius
        container.axis = .vertical
        container.spacing = .createAccountStackViewSpacing
        return container
    }()
    private lazy var buttonStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.layer.cornerRadius = .buttonStackViewCornerRadius
        container.axis = .vertical
        container.spacing = .buttonStackViewSpacing
        return container
    }()
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: L10n.CreateAccount.Navigation.title)
        label.font = UIFont.systemFont(ofSize: .titleLabelFont)
        return label
    }()
    private lazy var usernameTextField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.CreateAccount.Username.placeholder)
        return textfield
    }()
    private lazy var mailTextField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.CreateAccount.Email.placeholder)
        return textfield
    }()
    private lazy var passwordTextField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.CreateAccount.Password.placeholder)
        return textfield
    }()
    private lazy var passwordConfirmField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.CreateAccount.ConfirmPassword.placeholder)
        return textfield
    }()
    private lazy var usernameLabel: UILabel = TextFieldLabel(title: L10n.CreateAccount.Username.title)
    private lazy var mailLabel: UILabel = TextFieldLabel(title: L10n.CreateAccount.Email.title)
    private lazy var passwordLabel: UILabel = TextFieldLabel(title: L10n.CreateAccount.Password.title)
    private lazy var passwordConfirmLabel: UILabel = TextFieldLabel(title: L10n.CreateAccount.ConfirmPassword.title)
    private lazy var createAccountButton: UIButton = {
        let button = BlueCommonButton(title: L10n.CreateAccount.Button.title)
        button.addTarget(self, action: #selector(onCreateButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoStackView, createAccountStackView])
        stackView.spacing = .contentStackViewSpasing
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    private lazy var scrollView = UIScrollView(frame: .zero)
    
    // MARK: Init
    
    init(output: CreateAccountViewOutput) {
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
        addKeyboardObservers()
    }
    
    // MARK: Private
    
    private func setupUI() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        logoStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        buttonStackView.addArrangedSubviews([
            passwordConfirmField,
            createAccountButton
        ])
        createAccountStackView.addArrangedSubviews([
            titleLabel,
            usernameLabel,
            usernameTextField,
            mailLabel,
            mailTextField,
            passwordLabel,
            passwordTextField,
            passwordConfirmLabel,
            buttonStackView
        ])        
        createAccountStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        [
            usernameTextField,
            mailTextField,
            passwordTextField,
            passwordConfirmField,
            createAccountButton
        ].forEach { button in
            button.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
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
    
    // MARK: Actions
    @objc private func onCreateButtonClicked() {
        output.onCreateButtonClicked()
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardFrame = notification.keyboardFrame {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}

extension CreateAccountViewController: CreateAccountViewInput {
}
