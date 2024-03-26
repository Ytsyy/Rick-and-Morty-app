//
//  RegistrationCoordinator.swift
//  iosSchool_HH
//
//  Created by MaximM on 10.11.2023.
//

import Foundation
import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

    struct Context {
        let onRegistrationSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.registrationVC(onRegistrationSuccess: context.onRegistrationSuccess)
    }
}
