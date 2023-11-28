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
        let locationVC  = assembly.locationVC()

        locationVC.selectLocation = { [weak locationVC] locationData in
            /*let coordinator = self.assembly.charactersCoordinator(viewModel: locationData)
             guard let characterVC = coordinator.make() else {
             return
             }
             controller?.navigationController?.pushViewController(characterVC, animated: true)} */

        }
        return locationVC
    }
}
