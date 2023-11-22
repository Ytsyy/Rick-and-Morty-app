//
//  AppCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 06.11.2023.
//
import Foundation
import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.registrationCoordinator(onRegistrationSuccess: { [weak self] in
            print("print closure in func start (AppCoordinator)")
        })
        setRoot(viewController: coordinator.make())
    }

    private func authBootstrap() {
        setRoot(viewController: assembly.authCoordinator().make())
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
