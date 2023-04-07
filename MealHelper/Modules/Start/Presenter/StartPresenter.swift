import Foundation

protocol StartPresenterOutput: AnyObject {
    func openLoginScreen()
}

final class StartPresenter {
    // Dependencies
    weak var view: StartViewInput?
    private weak var output: StartPresenterOutput?
    private let authService: IAuthService
    
    // MARK: Init
    
    init(output: StartPresenterOutput?, authService: IAuthService) {
        self.output = output
        self.authService = authService
    }
}

// MARK: - StartViewOutput

extension StartPresenter: StartViewOutput {
    func viewDidLoad() {
        authService.doSomeWork()
    }
    
    func onLoginButtonClicked() {
        output?.openLoginScreen()
    }
    
    func onSignupButtonClicked() {
    }
    
    func onContinueButtonClicked() {
    }
}
