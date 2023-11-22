//
//  CharactersDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

protocol CharacterDataProvider {
    func getCharacter(
        id: Int,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
}

class CharacterDataProviderImp: CharacterDataProvider {

    private let apiClient: CharacterApiClient

    init(apiClient: CharacterApiClient) {
        self.apiClient = apiClient
    }

    func getCharacter(
        id: Int,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    ) {
        apiClient.getCharacter(id: id, onRequestCompleted: onRequestCompleted)
    }
}
