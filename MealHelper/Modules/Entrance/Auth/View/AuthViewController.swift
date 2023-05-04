//
//  AuthViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 3/29/23.
//

import UIKit
import SnapKit

private extension CGFloat {
    static let buttonStackViewCornerRadius: CGFloat = 10
    static let buttonStackViewSpacing: CGFloat = 20
    
}

final class AuthViewController: UIViewController {
    // Dependencies
    private let output: AuthViewOutput
    
    // UI
    private lazy var logoStackView: UIStackView = {
        let container = LogoStackView()
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
    private lazy var loginButton: UIButton = {
        let button = BlueCommonButton(title: L10n.SignIn.Button.title)
        button.addTarget(self, action: #selector(onLoginButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var signupButton: UIButton = {
        let button = BlueCommonButton(title: L10n.CreateAccount.Button.title)
        button.addTarget(self, action: #selector(onSignupButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle(L10n.Continue.Button.title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(onContinueButtonClicked), for: .touchUpInside)
        return button
    }()
    
    // MARK: Init
    
    init(output: AuthViewOutput) {
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
        
        buttonStackView.addArrangedSubviews([loginButton, signupButton, continueButton])

        view.addSubview(buttonStackView)
        view.addSubview(logoStackView)
        
        logoStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(150)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        [loginButton, signupButton].forEach { button in
            button.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }
    
    // MARK: Actions
    
    @objc private func onSignupButtonClicked() {
        output.onSignupButtonClicked()
    }
    
    @objc private func onLoginButtonClicked() {
        output.onLoginButtonClicked()
    }

    @objc private func onContinueButtonClicked() {
        output.onContinueButtonClicked()
    }
}

// MARK: - StartViewInput

extension AuthViewController: AuthViewInput {
}
