//
//  LocationViewController.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import UIKit

class LocationViewController: UIViewController {
    private let dataProvider: LocationDataProvider

    init(dataProvider: LocationDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllLocations()
    }

    func getAllLocations() {
        dataProvider.getAllLocations { location, error in
            print(location ?? "No locations")
            print(error?.rawValue ?? "No mistake")
        }
    }
}
