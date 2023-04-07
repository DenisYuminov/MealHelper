import Foundation

protocol StartViewInput: AnyObject {
}

protocol StartViewOutput: AnyObject {
    func onLoginButtonClicked()
    func onSignupButtonClicked()
    func onContinueButtonClicked()
}
