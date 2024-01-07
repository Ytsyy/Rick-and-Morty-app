//
//  UserProfileCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation
import UIKit

class UserProfileCoordinator: BaseCoordinator<UserProfileCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        let locationVC = assembly.locationVC()
        locationVC.selectLocation = { [weak locationVC] locationData in
            let coordinator = self.assembly.characterCoordinator(data: locationData)
            guard let characterVC = coordinator.make() else {
                return
            }
            locationVC?.navigationController?.pushViewController(characterVC, animated: true)
        }
        return locationVC
    }
}
