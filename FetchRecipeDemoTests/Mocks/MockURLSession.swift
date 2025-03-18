//
//  MockURLSession.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/17/25.
//

import Foundation
import SwiftUI
@testable import FetchRecipeDemo

class MockURLSession: URLSessionProtocol {
    func data(from url: URL, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        guard let data = UIImage(resource: .placeholder).pngData() else {
            throw URLError(.badURL)
        }
        return (data , URLResponse(url: url, mimeType: "image/png", expectedContentLength: 0, textEncodingName: nil))
    }
}


