//
//  CharactersAssembly.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

protocol CharacterAssembly {
    func characterCoordinator() -> CharacterCoordinator
    func characterVC() -> CharacterViewController
    func characterDataProvider() -> CharacterDataProvider
}

extension Assembly: CharacterAssembly {
    func characterCoordinator() -> CharacterCoordinator {
        CharacterCoordinator(assembly: self, context: .init())
    }
    func characterVC() -> CharacterViewController {
        .init(dataProvider: characterDataProvider())
    }

    func characterDataProvider() -> CharacterDataProvider {
        CharacterDataProviderImp(apiClient: apiClient)
    }
}
