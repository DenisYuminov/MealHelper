//
//  SettingsViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

private extension CGFloat {
    static let buttenCornerRadius: CGFloat = 60
}

final class SettingsViewController: UIViewController {
    // Dependencies
    private let output: SettingsViewOutput
    
    // UI
    private lazy var username = TitleLabel(title: "username")
    private lazy var imageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.camera, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 60
        button.layer.masksToBounds = true
        return button
    }()
    private lazy var themeLabel = CommonCreateLabel(title: L10n.Settings.ThemeCell.title)
    private lazy var themeSwitch: UISwitch = {
        let switchControl = UISwitch()
        return switchControl
    }()
    private lazy var languageLabel: UILabel = CommonCreateLabel(title: L10n.Settings.LanguageCell.title)
    private lazy var languageValueLabel: UILabel = CommonCreateLabel(title: L10n.Settings.LanguageCell.subTitle)
    private lazy var mailLabel: UILabel = CommonCreateLabel(title: L10n.Settings.MailCell.title)
    private lazy var mailValueLabel = SettingButton(title: "example@mail.com")
    private lazy var passwordLabel = SettingButton(title: L10n.Settings.PasswordCell.title)
    private lazy var deleteAccountButton: UIButton = {
        let button = SettingButton(title: L10n.Settings.DeleteAccount.title)
        button.setTitleColor(.systemRed, for: .normal)
        return button
    }()
    private lazy var logOutButton: UIButton = {
        let button = SettingButton(title: L10n.Settings.Exit.title)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var settingStackView: UIStackView = {
        let themeStackView = CommonHorizontalStackView(views: [themeLabel, themeSwitch])
        themeStackView.distribution = .equalCentering
        let languageStackView = CommonHorizontalStackView(views: [languageLabel, languageValueLabel])
        languageStackView.distribution = .equalCentering
        let mailStackView = CommonHorizontalStackView(views: [mailLabel, mailValueLabel])
        mailStackView.distribution = .equalCentering

        let stackView = CommonVerticalStackView(views: [
            themeStackView,
            languageStackView,
            mailStackView,
            passwordLabel
        ])
        return stackView
    }()
    private lazy var usernameAndImageStackView = CommonVerticalStackView(views: [imageButton, username])
    private lazy var exitStackView = CommonVerticalStackView(views: [logOutButton, deleteAccountButton])
    private lazy var contentStackView: UIStackView = {
        let stackView = CommonVerticalStackView(views: [ settingStackView, exitStackView])
        stackView.spacing = 70
        return stackView
    }()
    
    // MARK: Init

    init(output: SettingsViewOutput) {
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
        setup()
    }
    
    // MARK: Private
    
    private func setup() {
        view.addSubview(usernameAndImageStackView)
        usernameAndImageStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.centerX.equalToSuperview()
        }
        view.addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(usernameAndImageStackView).offset(200)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        imageButton.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }
    }
    
    // MARK: Actions
    
    @objc private func logOutButtonClicked() {
        output.onLogOutButtonClicked()
    }
}

// MARK: SettingsViewInput

extension SettingsViewController: SettingsViewInput {
}
