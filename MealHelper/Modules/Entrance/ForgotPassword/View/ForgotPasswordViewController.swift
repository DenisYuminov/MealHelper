//
//  ForgotPasswordViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    // Dependencies
    private let output: ForgotPasswordViewOutput
    // UI
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: L10n.ForgotPassword.Navigation.title)
        label.font = UIFont.systemFont(ofSize: 28)
        label.numberOfLines = 2
        return label
    }()
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.ForgotPassword.Info.title
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var mailTextField: UITextField = {
        let textfield = GrayCommonTextField(title: L10n.ForgotPassword.Mail.placeholder)
        return textfield
    }()
    private lazy var confirmButton: UIButton = {
        let button = BlueCommonButton(title: L10n.ForgotPassword.Button.title)
        button.addTarget(self, action: #selector(onConfirmButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var imageView: UIImageView = {
        let image = UIImage(systemName: "lock.circle")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    private lazy var imageStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
        container.axis = .vertical
        return container
    }()
    private lazy var confirmStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .clear
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
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Private
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        
        confirmStackView.addArrangedSubviews([
            titleLabel,
            subTitleLabel,
            mailTextField,
            confirmButton
        ])
        imageStackView.addArrangedSubview(imageView)
        
        view.addSubview(imageStackView)
        view.addSubview(confirmStackView)
        imageStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
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
        output.onConfirmButtonClicked()
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewInput {
}
