//
//  Episode.swift
//  iosSchool_HH
//
//  Created by Maxim on 07.02.2024.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
    }
}
