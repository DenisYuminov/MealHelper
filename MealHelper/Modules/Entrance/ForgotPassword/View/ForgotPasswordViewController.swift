//
//  ForgotPasswordViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/10/23.
//

import UIKit

private extension CGFloat {
    static let titleLabelFont: CGFloat = 28
    static let subTitleLabelFont: CGFloat = 20
    static let contentStackViewSpasing: CGFloat = 50
    static let confirmStackViewCornerRadius: CGFloat = 10
    static let confirmStackViewSpasing: CGFloat = 30
}

final class ForgotPasswordViewController: UIViewController {
    // Dependencies
    private let output: ForgotPasswordViewOutput
    
    // UI
    private lazy var titleLabel: UILabel = {
        let label = TitleLabel(title: L10n.ForgotPassword.Navigation.title)
        label.font = UIFont.systemFont(ofSize: .titleLabelFont)
        label.numberOfLines = 2
        return label
    }()
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.ForgotPassword.Info.title
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: .subTitleLabelFont)
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
        let image = UIImage.lockCircle
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
        container.layer.cornerRadius = .confirmStackViewCornerRadius
        container.axis = .vertical
        container.spacing = .confirmStackViewSpasing
        return container
    }()
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageStackView, confirmStackView])
        stackView.spacing = .contentStackViewSpasing
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    private lazy var scrollView = UIScrollView(frame: .zero)

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
        addKeyboardObservers()
    }
    
    // MARK: Private
    
    private func setupUI() {
        view.backgroundColor = UIColor(asset: Asset.Colors.backgroundColor)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        scrollView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        confirmStackView.addArrangedSubviews([
            titleLabel,
            subTitleLabel,
            mailTextField,
            confirmButton
        ])

        imageStackView.addArrangedSubview(imageView)
        imageStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalToSuperview().offset(150)
        }

        confirmStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageStackView.snp.bottom).offset(100)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.bottom.equalToSuperview().offset(-50)
        }

        [mailTextField, confirmButton].forEach { elem in
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
    
    @objc private func onConfirmButtonClicked() {
        output.onConfirmButtonClicked()
    }
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
}

// MARK: ForgotPasswordViewInput
extension ForgotPasswordViewController: ForgotPasswordViewInput {
}
