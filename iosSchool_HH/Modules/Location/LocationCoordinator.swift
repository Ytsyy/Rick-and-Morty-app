//
//  LocationCoordinator.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import UIKit

class LocationCoordinator: BaseCoordinator<LocationCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.locationVC()
    }
}
