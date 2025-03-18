//
//  MockRecipes.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/17/25.
//

import Foundation

// mock recipes for use in both unit tests and for loading previews
let mockRecipeA = Recipe(name: "Recipe A",
                        cuisine: "Cuisine B",
                        photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                        photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                        sourceURL: nil,
                        uuid: UUID().uuidString,
                        youtubeURL: nil)

let mockRecipeB = Recipe(name: "Recipe B",
                        cuisine: "Cuisine B",
                        photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                        photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                        sourceURL: nil,
                        uuid: UUID().uuidString,
                        youtubeURL: nil)

let mockRecipeC = Recipe(name: "Recipe C",
                        cuisine: "Cuisine A",
                        photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                        photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                        sourceURL: nil,
                        uuid: UUID().uuidString,
                        youtubeURL: nil)

let mockRecipes: [Recipe] = [mockRecipeA, mockRecipeB, mockRecipeC]
