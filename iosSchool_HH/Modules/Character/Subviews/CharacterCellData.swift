//
//  CharacterCellData.swift
//  iosSchool_HH
//
//  Created by student on 07.12.2023.
//

import Foundation
import UIKit

struct CharacterCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let isLoading: Bool
    let url: String
    let name: String?
    let description: String?
    let imageUrl: String?
    let image: UIImage?
    let episodes: [String]

    init(character: Character, isLoading: Bool, image: UIImage?, selectClosure: ((CoreCellInputData) -> Void)?) {
        url = character.url
        self.selectClosure = selectClosure
        self.isLoading = isLoading
        self.image = image
        name = character.name
        imageUrl = character.image
        description = character.gender.rawValue + " " + character.species

        episodes = character.episode
    }

    init(url: String) {
        self.url = url
        isLoading = true
        name = nil
        imageUrl = nil
        image = nil
        description = nil

        episodes = []
    }
}
