//
//  LocationViewData.swift
//  iosSchool_HH
//
//  Created by MaximM on 27.11.2023.
//

import Foundation

struct LocationViewData {
    let cellsData: [LocationCellData]

    init(list: LocationsList) {
        cellsData = list.results.map { LocationCellData(location: $0) }
    }
}
