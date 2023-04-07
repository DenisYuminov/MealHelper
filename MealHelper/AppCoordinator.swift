import UIKit

final class AppCoordinator {
    // Dependencies
    private let startCoordinator: IStartCoordinator
    
    // MARK: Init
    
    init(appPresentationAssembly: IAppPresentationAssembly) {
        self.startCoordinator = appPresentationAssembly.startCoordinator
    }
    
    // MARK: Internal
    
    func createRootViewController() -> UIViewController {
        startCoordinator.createFlow()
    }
}
