//
//  UserProfileAssembly.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation

protocol UserProfileAssembly {
    func userProfileVC() //-> UserProfileViewController
    //func userProfileDataProvider() -> userProfileDataProvider
    func userProfileCoordinator() -> UserProfileCoordinator
}

extension Assembly: UserProfileAssembly {
    func userProfileVC() /*-> UserProfileViewController */{
        //.init(dataProvider: UserProfileDataProvider())
        return
    }
/*
    func userProfileDataProvider() -> userProfileDataProvider {
        userProfileDataProviderImp(apiClient: apiClient)
    }
*/
    func userProfileCoordinator() -> UserProfileCoordinator {
        UserProfileCoordinator(assembly: self, context: .init())
    }
}
