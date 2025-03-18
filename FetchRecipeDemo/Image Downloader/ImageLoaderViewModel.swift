//
//  ImageLoaderViewModel.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/12/25.
//

import Foundation
import SwiftUI
import Combine

// URLSessionProtocol for dependency injection.
protocol URLSessionProtocol {
    func data(from url: URL, delegate: (any URLSessionTaskDelegate)? ) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}


class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let urLSession: URLSessionProtocol
    private let imageCache = ImageCache.shared
    private let urlString: String
    
    init(url: String, URLSession: URLSessionProtocol) {
        urlString = url
        self.urLSession = URLSession
        getImage()
    }
    
    func getImage() {
        if let savedImage = imageCache.getImage(forKey: urlString) {
            image = savedImage
        } else {
            Task {
                do {
                    try await downloadImage()
                } catch {
                    image = nil
                }
            }
        }
    }
    
    @MainActor
    func downloadImage() async throws {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        // 0.5 sec delay added deliberately to show loading of images
        try? await Task.sleep(nanoseconds: 500_000_000)

        let (data, _) = try await urLSession.data(from: url, delegate: nil)
        isLoading = false
        if let image = UIImage(data: data) {
            imageCache.setImage(image, forKey: urlString)
            self.image = image
        }
    }
}
