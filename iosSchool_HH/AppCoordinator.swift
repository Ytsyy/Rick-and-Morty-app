import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window

        let coordinator = assembly.authCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(viewController: coordinator.make())

    }

    private func authBootstrap() {
        guard assembly.storageManager.getToken() == nil else {
            setTabVC()
            return
        }

        let authCoordinator = assembly.authCoordinator { [weak self] in
            DispatchQueue.main.async {
                self?.setTabVC()
            }
        }
        setRoot(viewController: authCoordinator.make())
    }

    private func setTabVC() {
        let navVC = assembly.rootNavigationController()
        let tabVC = assembly.rootTabBarController()

        let locationsCoord = assembly.locationCoordinator()
        // let cabinetCoord = assembly.cabinetCoodrinator()
        guard let locationsVC = locationsCoord.make() else {

            return
        }

        // cabinetVC.tabBarItem = RootTab.cabinet.tabBarItem
        tabVC.setViewControllers([navVC], animated: false)

        setRoot(viewController: tabVC)
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
