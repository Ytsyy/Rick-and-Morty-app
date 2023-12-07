//
//  ImageService.swift
//  iosSchool_HH
//
//  Created by student on 30.11.2023.
//

import UIKit

protocol ImageServices {
    func getImage(url: String, completion: @escaping (UIImage?) -> ())
}

class ImageServicesImp: ImageServices {
    private var imageCache = [String: UIImage]()
    private let maxCacheSize = 50
    private let imageQueue = DispatchQueue(label: "com.example.imageQueue", attributes: .concurrent)

    func getImage(url: String, completion: @escaping (UIImage?) -> ()) {
        if let cachedImage = imageCache[url] {
            completion(cachedImage)
            return
        }

        DispatchQueue.global().async {
            if let url = URL(string: url), let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData){
                self.cacheImage(url: url.absoluteString, image: image)

                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    private func cacheImage(url: String, image: UIImage) {
            imageQueue.async(flags: .barrier) {
                self.imageCache[url] = image

                if self.imageCache.count > self.maxCacheSize {
                    let keysToRemove = Array(self.imageCache.keys.prefix(self.imageCache.count - self.maxCacheSize))
                    for key in keysToRemove {
                        self.imageCache.removeValue(forKey: key)
                    }
                }
            }
        }
    }

