//
//  LocationCellData.swift
//  iosSchool_HH
//
//  Created by MaximM on 27.11.2023.
//

import Foundation

struct LocationCellData {
    let name: String
    let type: String
    let population: String
    let residents: [String]

    init(location: Location) {
        name = location.name
        type = location.type
        residents = location.residents
        population = "Население: \(location.residents.count)"
    }
}
