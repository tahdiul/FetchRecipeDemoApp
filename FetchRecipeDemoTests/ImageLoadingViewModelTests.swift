//
//  ImageLoadingViewModelTests.swift
//  FetchRecipeDemoTests
//
//  Created by Tahdiul Haq on 3/17/25.
//

import Foundation
@testable import FetchRecipeDemo
import XCTest
import Combine

final class ImageLoadingViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    let imageCache = ImageCache.shared
    var sut: ImageLoadingViewModel!
    
    override func setUp() {
        super.setUp()
        
    }

    func test_getImage_downloadsImage() async throws {
        let placeholderImageURL = "placeholderImageURL"
        imageCache.removeImage(forKey: placeholderImageURL)
        sut = ImageLoadingViewModel(url: placeholderImageURL, URLSession: MockURLSession())
        
        // this expectation will be fulfilled once the image is downloaded, ie. isLoading is false and the image exists
        let expectation = XCTestExpectation(description: "Wait for image to download")
        sut.getImage()
        sut.$isLoading
            .dropFirst()
            .sink {
                if $0 == false,
                   self.sut.image != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        await fulfillment(of: [expectation] , timeout: 2)
    }
    
    func test_getImage_doesNotDownloadCachedImage() async throws {
        let placeholderImageURL = "placeholderImageURL"
        sut = ImageLoadingViewModel(url: placeholderImageURL, URLSession: MockURLSession())
        
        let expectation = XCTestExpectation(description: "Wait for image to download")
        sut.getImage()
        sut.$isLoading
            .dropFirst()
            .sink {
                if $0 == false,
                   self.sut.image != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        await fulfillment(of: [expectation] , timeout: 2)
        
        // create new sut with same url. This should result in getting cached image
        sut = ImageLoadingViewModel(url: placeholderImageURL, URLSession: MockURLSession())
        sut.getImage()
        XCTAssert(sut.image != nil, "Image should not be downloaded from network")
        
        let invertedExpectation = XCTestExpectation(description: "Image should not download")
        invertedExpectation.isInverted = true
        
        sut.$isLoading
            .dropFirst()
            .sink {
                if $0 == true {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        await fulfillment(of: [invertedExpectation] , timeout: 2)
    }


}
