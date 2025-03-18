//
//  DownloadingImageView.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/12/25.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @StateObject var loader: ImageLoadingViewModel
    
    init(url: String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, URLSession: URLSession.shared))
    }
    
    // shows loader when loading, and placeholder image if image download fails.
    // Otherwise loads image from cache or downloads it
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image(uiImage: .placeholder)
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
