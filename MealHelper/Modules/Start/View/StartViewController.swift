import UIKit
import SnapKit
class StartViewController: UIViewController {
    private let output: StartViewOutput
    
    init(output: StartViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        let buttonContainer = UIView()
        buttonContainer.backgroundColor = .white
        buttonContainer.layer.cornerRadius = 10

        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 10

        let signupButton = UIButton()
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.backgroundColor = .blue
        signupButton.layer.cornerRadius = 10

        let continueButton = UIButton()
        continueButton.setTitle("Continue without auth", for: .normal)
        continueButton.setTitleColor(.blue, for: .normal)

        buttonContainer.addSubview(loginButton)
        buttonContainer.addSubview(signupButton)
        buttonContainer.addSubview(continueButton)

        view.addSubview(buttonContainer)

        buttonContainer.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(50)
            make.width.equalToSuperview().multipliedBy(0.8)
        }

        loginButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        signupButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        continueButton.snp.makeConstraints { (make) in
            make.top.equalTo(signupButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }


        loginButton.addTarget(self, action: #selector(onLoginButtonClicked), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(onSignupButtonClicked), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(onContinueButtonClicked), for: .touchUpInside)
    }

}

extension StartViewController: StartViewInput {
    @objc func onSignupButtonClicked() {
        output.onSignupButtonClicked()
    }
    
    @objc func onLoginButtonClicked() {
        output.onLoginButtonClicked()
    }

    @objc func onContinueButtonClicked() {
        output.onContinueButtonClicked()
    }
}
