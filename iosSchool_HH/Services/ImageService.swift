//
//  ImageService.swift
//  iosSchool_HH
//
//  Created by student on 30.11.2023.
//

import UIKit

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServiceImp: ImageService {
    private var imageDict: [String: UIImage] = [:]
    private let apiClient: ApiClient
    private let updateImageQueue = DispatchQueue(label: "ImageService.updateQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageDict[url] {
            completion(cachedImage)
            return
        }

        DispatchQueue.global().async { [weak self] in
            self?.apiClient.requestImageData(url: url) { [weak self] data in
                guard let data = data, let downloadedImage = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                self?.updateImageQueue.async { [weak self] in
                    if self?.imageDict.count ?? 0 >= 50 {
                        self?.imageDict.removeAll()
                    }
                    self?.imageDict[url] = downloadedImage
                }
                completion(downloadedImage)
            }
        }
    }
}
