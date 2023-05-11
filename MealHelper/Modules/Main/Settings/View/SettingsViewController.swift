//
//  SettingsViewController.swift
//  MealHelper
//
//  Created by macbook Denis on 4/16/23.
//

import UIKit

private extension CGFloat {
    static let buttenCornerRadius: CGFloat = 60
    static let heightForHeaderInSection: CGFloat = 120
}

class SettingsViewController: UIViewController {
    // Dependencies
    private let output: SettingsViewOutput
    
    // UI
    private lazy var username: UILabel = {
        let label = TitleLabel(title: "username")
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    private lazy var imageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.camera, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = .buttenCornerRadius
        button.layer.masksToBounds = true
        return button
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    private lazy var stackView = CommonVerticalStackVIew(views: [imageButton, username])
    
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
        view.addSubview(tableView)
        setup()
    }
    
    // Private
    private func setup() {
        stackView.distribution = .equalCentering
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
        }
        imageButton.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stackView).inset(-10)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension SettingsViewController: SettingsViewInput {
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        ) as? SettingsTableViewCell else {
            fatalError("Failed to dequeue SettingsTableViewCell.")
        }
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.leftLabel.text = L10n.Settings.ThemeCell.title
                cell.rightLabel.text = L10n.Settings.ThemeCell.Title.light
            case 1:
                cell.leftLabel.text = L10n.Settings.LanguageCell.title
                cell.rightLabel.text = L10n.Settings.LanguageCell.subTitle
            case 2:
                cell.leftLabel.text = L10n.Settings.MailCell.title
                cell.rightLabel.text = "example@mail.com"
            case 3:
                cell.leftLabel.text = L10n.Settings.PasswordCell.title
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                cell.leftLabel.text = L10n.Settings.Exit.title
                cell.leftLabel.textColor = .systemBlue
            case 1:
                cell.leftLabel.text = L10n.Settings.DeleteAccount.title
                cell.leftLabel.textColor = .systemRed
            default:
                break
            }
        default:
            break
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10))
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 3:
                break
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                output.onLogOutButtonClicked()
            case 1:
                break
            default:
                break
            }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
