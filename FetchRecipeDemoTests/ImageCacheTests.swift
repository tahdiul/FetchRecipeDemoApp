//
//  ImageCacheTests.swift
//  FetchRecipeDemoTests
//
//  Created by Tahdiul Haq on 3/7/25.
//

import XCTest
@testable import FetchRecipeDemo

final class ImageCacheTests: XCTestCase {

    let imageCache = ImageCache.shared

    func test_getImage_returnsNil() throws {
        let imageKeyNotPresent: String = "imageKeyNotPresent"
        XCTAssertNil(imageCache.getImage(forKey: imageKeyNotPresent))
    }


    func test_getImage_returnsImage() throws {
        let imageKey: String = "placeholderKey"
        let image: UIImage = .placeholder
        imageCache.setImage(image, forKey: imageKey)
        
        XCTAssertEqual(image, imageCache.getImage(forKey: imageKey))
    }

    func test_removeImage_deletesImage() throws {
        let imageKey: String = "placeholderKey"
        let image: UIImage = .placeholder
        imageCache.setImage(image, forKey: imageKey)
        
        XCTAssertEqual(image, imageCache.getImage(forKey: imageKey))
        
        imageCache.removeImage(forKey: imageKey)
        XCTAssertNil(imageCache.getImage(forKey: imageKey))
    }

}
