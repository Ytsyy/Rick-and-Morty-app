//
//  Character.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

class Character: Codable {
    enum Gender: String, CaseIterable, Codable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown
    }

    let name: String
    let species: String
    let image: String
    let url: String
    let episode: [String]
    let gender: Gender
}
