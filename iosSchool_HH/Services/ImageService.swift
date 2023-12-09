//
//  ImageService.swift
//  iosSchool_HH
//
//  Created by student on 30.11.2023.
//

import UIKit

protocol ImageServices {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServicesImp: ImageServices {
    private var imageCache = NSCache<NSString, UIImage>()
    private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: NSString(string: url)) {
            completion(cachedImage)
            return
        }

        downloadImage(url: url) { [weak self] image in
            if let image = image {
                self?.imageCache.setObject(image, forKey: NSString(string: url))
                self?.clearCacheIfNeeded()
            }

            completion(image)
        }
    }

    private func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        apiClient.requestImageData(url: url) { [weak self] data in
            guard let data = data, let downloadedImage = UIImage(data: data) else {
                completion(nil)
                return
            }

            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }
    }

    private func clearCacheIfNeeded() {
        if imageCache.totalCostLimit > 50 {
            imageCache.removeAllObjects()
        }
    }
}
