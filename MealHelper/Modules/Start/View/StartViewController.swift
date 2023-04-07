import UIKit
import SnapKit

final class StartViewController: UIViewController {
    // Dependencies
    private let output: StartViewOutput
    
    // UI
    private lazy var buttonStackView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.axis = .vertical
        container.spacing = 20
        return container
    }()
    private lazy var loginButton: UIButton = {
        let button = BlueCommonButton(title: "Sign in")
        button.addTarget(self, action: #selector(onLoginButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var signupButton: UIButton = {
        let button = BlueCommonButton(title: "Create account")
        button.addTarget(self, action: #selector(onSignupButtonClicked), for: .touchUpInside)
        return button
    }()
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue without profile", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(onContinueButtonClicked), for: .touchUpInside)
        return button
    }()
    
    // MARK: Init
    
    init(output: StartViewOutput) {
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
        view.backgroundColor = .white
        
        buttonStackView.addArrangedSubviews([loginButton, signupButton, continueButton])

        view.addSubview(buttonStackView)

        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(150)
            make.width.equalToSuperview().multipliedBy(0.75)
        }
        [loginButton, signupButton, continueButton].forEach { button in
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

extension StartViewController: StartViewInput {
}
