import Foundation

protocol StartViewInput: AnyObject {
    func onLoginButtonClicked()
    func onSignupButtonClicked()
    func onContinueButtonClicked()
}

protocol StartViewOutput: AnyObject {
    func onLoginButtonClicked()
    func onSignupButtonClicked()
    func onContinueButtonClicked()
}
