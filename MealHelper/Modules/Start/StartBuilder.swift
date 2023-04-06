import UIKit

final class StartBuilder {
    static func build() -> UIViewController {
        let presenter = StartPresenter()
        let view = StartViewController(output: presenter)
        presenter.view = view
        return view
    }
}
