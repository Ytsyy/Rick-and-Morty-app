//
//  UserProfileAssembly.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation

protocol UserProfileAssembly {
    func UserProfileVC(onProfileLogout: (() -> Void)?) -> UserProfileViewController<UserProfileViewImp>
    func UserProfileDataProvider() -> UserProfileDataProvider
    func UserProfileCoordinator(onProfileLogout: (() -> Void)?) -> UserProfileCoordinator
}

extension Assembly: ProfileAssembly {
    func UserpPofileVC(onProfileLogout: (() -> Void)?) -> UserProfileViewController<ProfileViewImp> {
        .init(dataProvider: UserProfileDataProvider(), storageManager: storageManager, onProfileLogout: onProfileLogout)
    }

    func UserProfileDataProvider() -> ProfileDataProvider {
        userProfileDataProviderImp(apiClient: apiClient)
    }

    func UserPprofileCoordinator(onProfileLogout: (() -> Void)?) -> UserProfileCoordinator {
        UserProfileCoordinator(assembly: self, context: .init(onProfileLogout: onProfileLogout))
    }
}
