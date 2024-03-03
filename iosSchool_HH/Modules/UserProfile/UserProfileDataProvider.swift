//
//  UserProfileDataProvider.swift
//  iosSchool_HH
//
//  Created by student on 27.12.2023.
//

import Foundation

protocol UserProfileDataProvider {
    func userProfile(userId: String, onRequestCompleted: @escaping (UserProfile?, ApiError?) -> Void)
}

final class UserProfileDataProviderImp: UserProfileDataProvider {
    private let apiClient: UserProfileApiClient

    init(apiClient: UserProfileApiClient) {
        self.apiClient = apiClient
    }

    func userProfile(userId: String, onRequestCompleted: @escaping (UserProfile?, ApiError?) -> Void) {
        apiClient.userProfile(userId: userId, onRequestCompleted: onRequestCompleted)
    }
}
