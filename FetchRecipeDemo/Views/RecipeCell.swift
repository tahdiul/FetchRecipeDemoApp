//
//  RecipeCell.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/10/25.
//

import SwiftUI

struct RecipeCell: View {

    init(recipe: Recipe) {
        title = recipe.name
        subtitle = recipe.cuisine
        imageURLString = recipe.photoURLSmall
    }
    
    let title: String
    let subtitle: String
    let imageURLString: String
    
    var body: some View {
        HStack {
            //ImageLoaderView(urlString: imageName)
            DownloadingImageView(url: imageURLString).frame(width: 100, height: 100)
            
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundStyle(.brandOrange)
                        .frame(maxWidth: .infinity, alignment: .leading)
                
                    Text(subtitle)
                        .foregroundStyle(.brandDarkGrey)
                }
                .font(.callout)
                

            }
            .padding(.trailing, 16)
        }
        .background(.brandBackgroundGrey)
        .cornerRadius(8)
    }
}

#Preview {
    RecipeCell(recipe: mockRecipeA)
}
