

import Foundation

protocol PersonDataProvider {
    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void)
}

final class PersonDataProviderImp: PersonDataProvider {
    private let apiClient: PersonApiClient

    init(apiClient: PersonApiClient) {
        self.apiClient = apiClient
    }

    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void) {
        apiClient.episode(url: url, onRequestCompleted: onRequestCompleted)
    }
}
