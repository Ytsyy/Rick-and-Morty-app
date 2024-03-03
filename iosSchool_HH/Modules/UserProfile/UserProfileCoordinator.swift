//
//  UserProfileCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import UIKit

final class UserProfileCoordinator: BaseCoordinator<UserProfileCoordinator.Context> {
    struct Context {
        let onUserProfileLogout: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.userProfileVC(onUserProfileLogout: context.onUserProfileLogout)
    }
}
