//
//  DataManager.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/10/25.
//

import Foundation

protocol DataManagerProtocol {
    func getRecipes() async throws -> [Recipe]
    func getRecipesNoData() async throws -> [Recipe]
    func getRecipesMalformed() async throws -> [Recipe]
}

class DataManager: DataManagerProtocol {
    
    // hard coding urls into this class for this demo. in a real app these urls would be injected from a config file/json etc
    func getRecipes() async throws -> [Recipe] {
        try await getRecipes(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")
    }
    
    func getRecipesNoData() async throws -> [Recipe] {
        try await getRecipes(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json")
    }
    
    func getRecipesMalformed() async throws -> [Recipe] {
        try await getRecipes(urlString: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
    }
    
    private func getRecipes(urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        // URLSession should also be injected in this class for testing. But I chose to write tests for the RecipeListViewModel class instead which tests downloading recipes
        let (data, _) = try await URLSession.shared.data(from: url)
        let recipes = try JSONDecoder().decode(Recipes.self, from: data)
        return recipes.recipes
    }
}
