//
//  AppCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//
import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window

        let coordinator = assembly.authCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(
            viewController: coordinator.make()
        )
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
        let tabVC = assembly.rootTabBarController()
        
        let locationsCoord = assembly.locationCoordinator()
        let userProfileCoord = assembly.userProfileCoordinator()
        guard let locationsVC = locationsCoord.make(), let userProfileVC = userProfileCoord.make() else {
            return
        }/*
          let navVC = assembly.rootNavigationController()
          navVC.setViewControllers([locationsVC, userProfileVC], animated: false)
          navVC.tabBarItem = RootTab.locations.tabBarItem
          userProfileVC.tabBarItem = RootTab.cabinet.tabBarItem
          tabVC.setViewControllers([navVC], animated: false)
          setRoot(viewController: tabVC) */
        
        let navVC1 = assembly.rootNavigationController()
        navVC1.setViewControllers([locationsVC], animated: false)
        navVC1.tabBarItem = RootTab.locations.tabBarItem
        
        let navVC2 = assembly.rootNavigationController()
        navVC2.setViewControllers([userProfileVC], animated: false)
        navVC2.tabBarItem = RootTab.cabinet.tabBarItem
        
        tabVC.setViewControllers([navVC1, navVC2], animated: false)
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
