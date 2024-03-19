//
//  CharactersAssembly.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

protocol CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp>
    func characterDataProvider() -> CharacterDataProvider
    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator
}

extension Assembly: CharacterAssembly {
    func characterVC(data: LocationCellData) -> CharacterViewController<CharacterViewImp> {
        .init(dataProvider: characterDataProvider(), imageService: imageService, data: data)
    }

    func characterDataProvider() -> CharacterDataProvider {
        CharacterDataProviderImp(apiClient: apiClient)
    }

    func characterCoordinator(data: LocationCellData) -> CharacterCoordinator {
        CharacterCoordinator(assembly: self, context: .init(data: data))
    }
}
