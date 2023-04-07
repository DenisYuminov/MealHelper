import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // Dependencies
    var window: UIWindow?
    private let appCoordinator = AppCoordinator(
        appPresentationAssembly: AppPresentationAssembly(servicesAssembly: AppServicesAssembly())
    )
    
    // MARK: UISceneDelegate
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = appCoordinator.createRootViewController()
        window.makeKeyAndVisible()
    }
}
