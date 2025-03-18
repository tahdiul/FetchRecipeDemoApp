//
//  MockDataManager.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/17/25.
//

import Foundation
@testable import FetchRecipeDemo

class MockDataManager: DataManagerProtocol {
    func getRecipes() async throws -> [FetchRecipeDemo.Recipe] {
        return mockRecipes
    }
    
    func getRecipesNoData() async throws -> [FetchRecipeDemo.Recipe] {
        return []
    }
    
    func getRecipesMalformed() async throws -> [FetchRecipeDemo.Recipe] {
        throw URLError(.badServerResponse)
    }
    
}
