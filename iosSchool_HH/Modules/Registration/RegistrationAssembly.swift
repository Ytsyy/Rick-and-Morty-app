//
//  RegistrationAssembly.swift
//  iosSchool_HH
//
//  Created by student on 10.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController
    func registrationDataProvider() -> RegistrationDataProvider
}

extension Assembly: RegistrationAssembly {

    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init(onRegistrationSuccess: onRegistrationSuccess))
    }

    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController {
        .init(dataProvider: registrationDataProvider(), onRegistrationSuccess: onRegistrationSuccess)
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(apiClient: apiClient)
    }
}
