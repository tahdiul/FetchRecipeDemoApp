//
//  Recipe.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/10/25.
//
import Foundation

struct Recipes: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Equatable {

    let name: String
    let cuisine: String
    let photoURLLarge: String
    let photoURLSmall: String
    let sourceURL: String?
    let uuid: String
    let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case name
        case cuisine
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case uuid
        case youtubeURL = "youtube_url"
    }
}
