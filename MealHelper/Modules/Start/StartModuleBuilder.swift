import UIKit

protocol IStartModuleBuilder: AnyObject {
    func build(output: StartPresenterOutput?) -> UIViewController
}

final class StartModuleBuilder: IStartModuleBuilder {
    // Dependencies
    private let authService: IAuthService
    
    // MARK: Init
    
    init(authService: IAuthService) {
        self.authService = authService
    }
    
    // MARK: IStartModuleBuilder
    
    func build(output: StartPresenterOutput?) -> UIViewController {
        let presenter = StartPresenter(output: output, authService: authService)
        let view = StartViewController(output: presenter)
        presenter.view = view
        return view
    }
}
