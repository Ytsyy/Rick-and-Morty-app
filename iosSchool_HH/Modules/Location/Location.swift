//
//  Location.swift
//  iosSchool_HH
//
//  Created by MaximM on 22.11.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
}
