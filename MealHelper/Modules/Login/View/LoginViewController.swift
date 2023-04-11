//
//  LoginViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//
import UIKit

final class LoginViewController: UIViewController {
    // Dependencies
    private let output: LoginViewOutput
    // UI
    private lazy var signInStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.layer.cornerRadius = 10
        container.axis = .vertical
        container.spacing = 20
        return container
    }()
    private lazy var titleStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.axis = .vertical
        return container
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(onForgotButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var mailTextField: UITextField = {
        let textfield = GrayCommonTextField(title: "  Enter your mail")
        return textfield
    }()
    private lazy var passwordTextField: UITextField = {
        let textfield = GrayCommonTextField(title: "  Enter your password")
        textfield.isSecureTextEntry = true
        return textfield
    }()
    private lazy var signInButton: UIButton = {
        let button = BlueCommonButton(title: "Sign in")
        return button
    }()
    
    // MARK: Init
    
    init(output: LoginViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Private
    
    private func setupUI() {
        view.backgroundColor = .white
        
        titleStackView.addArrangedSubview(titleLabel)
        
        signInStackView.addArrangedSubviews([
            titleStackView,
            mailTextField,
            passwordTextField,
            forgotPasswordButton,
            signInButton
        ])
        
        view.addSubview(signInStackView)
        
        titleStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        signInStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(120)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        
        [mailTextField, passwordTextField, signInButton].forEach { elem in
            elem.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }
    
    // MARK: Actions
    @objc private func onForgotButtonClicked() {
        output.onForgotButtonClicked()
    }
}

extension LoginViewController: LoginViewInput {
}
