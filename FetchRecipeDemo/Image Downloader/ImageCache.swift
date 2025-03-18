//
//  ImageCache.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/12/25.
//

import UIKit

class ImageCache {
    // Singletons should be avoided if possible but in this simple scenario I choose to use it for simplicity
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func removeImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
