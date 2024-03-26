//
//  UserProfileAssembly.swift
//  iosSchool_HH
//
//  Created by MaximM on 27.12.2023.
//

import Foundation

protocol UserProfileAssembly {
    func userProfileVC(onUserProfileLogout: (() -> Void)?) -> UserProfileViewController<UserProfileViewImp>
    func userProfileDataProvider() -> UserProfileDataProvider
    func userProfileCoordinator(onUserProfileLogout: (() -> Void)?) -> UserProfileCoordinator
}

extension Assembly: UserProfileAssembly {
    func userProfileVC(onUserProfileLogout: (() -> Void)?) -> UserProfileViewController<UserProfileViewImp> {
        .init(dataProvider: userProfileDataProvider(), storageManager: storageManager, onUserProfileLogout: onUserProfileLogout)
    }

    func userProfileDataProvider() -> UserProfileDataProvider {
        UserProfileDataProviderImp(apiClient: apiClient)
    }

    func userProfileCoordinator(onUserProfileLogout: (() -> Void)?) -> UserProfileCoordinator {
        UserProfileCoordinator(assembly: self, context: .init(onUserProfileLogout: onUserProfileLogout))
    }
}

