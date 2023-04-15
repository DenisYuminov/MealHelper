//
//  CreateAccountViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/12/23.
//

import UIKit

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
        container.layer.cornerRadius = 8
        container.axis = .vertical
        container.spacing = 8
        return container
    }()
    private lazy var buttonStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.layer.cornerRadius = 8
        container.axis = .vertical
        container.spacing = 25
        return container
    }()
    private lazy var titleStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.axis = .vertical
        return container
    }()
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: L10n.CreateAccount.Navigation.title)
        label.font = UIFont.systemFont(ofSize: 32)
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
    private lazy var usernameLabel: UILabel = {
        let label = LogoLabel(title: L10n.CreateAccount.Username.title, size: 17)
        label.textAlignment = .left
        return label
    }()
    private lazy var mailLabel: UILabel = {
        let label = LogoLabel(title: L10n.CreateAccount.Email.title, size: 17)
        label.textAlignment = .left
        return label
    }()
    private lazy var passwordLabel: UILabel = {
        let label = LogoLabel(title: L10n.CreateAccount.Password.title, size: 17)
        label.textAlignment = .left
        return label
    }()
    private lazy var passwordConfirmLabel: UILabel = {
        let label = LogoLabel(title: L10n.CreateAccount.ConfirmPassword.title, size: 17)
        label.textAlignment = .left
        return label
    }()
    private lazy var createAccountButton: UIButton = {
        let button = BlueCommonButton(title: L10n.CreateAccount.Button.title)
        return button
    }()
    
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
    }
    
    // MARK: Private
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(logoStackView)
        logoStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-240)
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
        view.addSubview(createAccountStackView)
        
        createAccountStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(120)
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
}

extension CreateAccountViewController: CreateAccountViewInput {
}
