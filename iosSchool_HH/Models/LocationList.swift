//
//  LocationList.swift
//  iosSchool_HH
//
//  Created by Maxim on 04.03.2024.
//

import Foundation

struct LocationsList: Decodable {
    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Location]
}
