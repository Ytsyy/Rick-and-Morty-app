//
//  ProfileApiClien.swift
//  iosSchool_HH
//
//  Created by Maxim on 21.02.2024.
//

import Foundation

protocol UserProfileApiClient {
    func userProfile(userId: String, onRequestCompleted: @escaping (UserProfile?, ApiError?) -> Void)
}

extension ApiClient: UserProfileApiClient {
    func userProfile(userId: String, onRequestCompleted: @escaping (UserProfile?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.nanoPost + "/v1/profile/\(userId)"
        performRequest(url: url, data: nil, method: .get) { (result: Result<UserProfile, ApiError>) in
            switch result {
            case .success(let profile):
                onRequestCompleted(profile, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
