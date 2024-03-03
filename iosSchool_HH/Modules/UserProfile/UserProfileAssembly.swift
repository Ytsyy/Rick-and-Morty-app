//
//  UserProfileAssembly.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation

import Foundation

protocol UserProfileAssembly {
    func userProfileVC(onUserProfileLogout: (() -> Void)?) -> UserProfileViewController<UserProfileViewImp>
    func userProfileDataProvider() -> UserProfileDataProvider
    func userProfileCoordinator(onUserProfileLogout: (() -> Void)?) -> UserProfileCoordinator
}

extension Assembly: UserProfileAssembly {
    func userProfileVC(onUserProfileLogout: (() -> Void)?) -> UserProfileViewController<UserProfileViewImp> {
        .init(dataProvider: userProfileDataProvider(), storageManager: storageManager, onProfileLogout: onUserProfileLogout)
    }

    func userProfileDataProvider() -> UserProfileDataProvider {
        UserProfileDataProviderImp(apiClient: apiClient)
    }

    func userProfileCoordinator(onUserProfileLogout: (() -> Void)?) -> UserProfileCoordinator {
        UserProfileCoordinator(assembly: self, context: .init(onUserProfileLogout: onUserProfileLogout))
    }
}

