//
//  LoginViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit

private extension CGFloat {
    static let signInStackViewCornerRadius: CGFloat = 10
    static let signInStackViewSpacing: CGFloat = 20
    static let contentStackViewSpasing: CGFloat = 50
}

final class LoginViewController: UIViewController {
    // Dependencies
    private let output: LoginViewOutput
    
    // UI
    private lazy var logoStackView: UIStackView = {
        let container = LogoStackView()
        return container
    }()
    private lazy var signInStackView: UIStackView = {
        let container = UIStackView(arrangedSubviews: [
            titleLabel,
            mailTextField,
            passwordTextField,
            forgotPasswordButton,
            signInButton
        ])
        container.backgroundColor = .clear
        container.layer.cornerRadius = .signInStackViewCornerRadius
        container.axis = .vertical
        container.spacing = .signInStackViewSpacing
        return container
    }()
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: L10n.SignIn.Navigation.title)
        return label
    }()
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.SignIn.ForgotPassword.Button.title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(onForgotButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var mailTextField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.SignIn.Email.placeholder)
        return textfield
    }()
    private lazy var passwordTextField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.SignIn.Password.placeholder)
        textfield.isSecureTextEntry = true
        return textfield
    }()
    private lazy var signInButton: UIButton = {
        let button = BlueCommonButton(title: L10n.SignIn.Button.title)
        button.addTarget(self, action: #selector(onSignInButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoStackView, signInStackView])
        stackView.spacing = .contentStackViewSpasing
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    private lazy var scrollView = UIScrollView(frame: .zero)

    // MARK: Init
    
    init(output: LoginViewOutput) {
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
        view.backgroundColor = .systemGray6
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
        
        scrollView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        logoStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
        }
        signInStackView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        
        [mailTextField, passwordTextField, signInButton].forEach { elem in
            elem.snp.makeConstraints { make in
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
    
    @objc private func onSignInButtonClicked() {
        output.onSignInButtonClicked()
    }
    
    @objc private func onForgotButtonClicked() {
        output.onForgotButtonClicked()
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

// MARK: LoginViewInput

extension LoginViewController: LoginViewInput {
}
