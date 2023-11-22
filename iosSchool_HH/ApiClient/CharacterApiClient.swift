//
//  CharactersApiClient.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

protocol CharacterApiClient {
    func getCharacter(
        id: Int,
        onRequestCompleted: @escaping (Character?, ApiError?) -> Void
    )
}

extension ApiClient: CharacterApiClient {
    func getCharacter(id: Int, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.characterURL + "/" + String(describing: id)
        performRequest(url: url, data: nil, method: .get) { (result: Result<Character, ApiError>) in
            switch result {
            case .success(let character):
                onRequestCompleted(character, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
