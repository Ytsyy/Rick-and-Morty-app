//
//  LocationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

protocol LocationApiClient {
    func getAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

extension ApiClient: LocationApiClient {
    func getAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.locationURL
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case .success(let locations):
                onRequestCompleted(locations, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
