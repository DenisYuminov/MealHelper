//
//  ForgotPasswordViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    // Dependencies
    private let output: ForgotPasswordViewOutput
    // UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password recovery"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your mail where you will receive your new password"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var mailTextField: UITextField = {
        let textfield = GrayCommonTextField(title: "  Enter your mail")
        return textfield
    }()
    private lazy var confirmButton: UIButton = {
        let button = BlueCommonButton(title: "Confirm")
        button.addTarget(self, action: #selector(onConfirmButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var confirmStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.axis = .vertical
        container.spacing = 30
        return container
    }()
    // MARK: Init
    init(output: ForgotPasswordViewOutput) {
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
    // MARK: private
    private func setupUI() {
        view.backgroundColor = .white
        
        confirmStackView.addArrangedSubviews([
            titleLabel,
            subTitleLabel,
            mailTextField,
            confirmButton
        ])
        
        view.addSubview(confirmStackView)
        
        confirmStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(120)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        [mailTextField, confirmButton].forEach { elem in
            elem.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }
    
    // MARK: Actions
    @objc private func onConfirmButtonClicked() {
        output.onConfirmbuttonClicked()
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewInput {
}
