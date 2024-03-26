//
//  LocationDataProvider.swift
//  iosSchool_HH
//
//  Created by MaximM on 22.11.2023.
//

import Foundation

protocol LocationDataProvider {
    func getAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationDataProviderImp: LocationDataProvider {
    private let apiClient: LocationApiClient

    init(apiClient: LocationApiClient) {
        self.apiClient = apiClient
    }

    func getAllLocations(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.getAllLocations(onRequestCompleted: onRequestCompleted)
    }
}
