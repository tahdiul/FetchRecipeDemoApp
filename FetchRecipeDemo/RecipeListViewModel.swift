//
//  RecipeListViewModel.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/17/25.
//

import SwiftUI

@MainActor
final class RecipeListViewModel: ObservableObject {
    
    private let dataManager: DataManagerProtocol
    
    // Default datamanager initialized directly here for simplicity.
    // In real app dependency injection would be handled when creating this file (or using swinject)
    init(dataManager: DataManagerProtocol = DataManager()) {
        self.dataManager = dataManager
    }
    @Published private(set) var recipes: [Recipe] = []
    
    // loading bool used for displaying loading indicatior
    @Published var loading = false
    // if errorDescription is not nil that means there was an error getting data.
    @Published var errorDescription: String?
    // recipeJsonType used to bind to picker to show recepies, error state and empty state UIs
    @Published var recipeJsonType: RecipeJsonType = .recipes
    // sortType used to bind to picker to sort the list
    @Published var sortType: SortType = .cuisine

    func getData() {
        Task {
            do {
                loading = true
                errorDescription = nil
                recipes = []
                
                // 0.5 sec delay added deliberately to see loading state easily, and simulate network delay
                try? await Task.sleep(nanoseconds: 500_000_000)
                let unsortedRecipes: [Recipe]
                switch recipeJsonType {
                case .recipes:
                    unsortedRecipes = try await Array(dataManager.getRecipes())
                case .noData:
                    unsortedRecipes = try await Array(dataManager.getRecipesNoData())
                case .malformedJson:
                    unsortedRecipes = try await Array(dataManager.getRecipesMalformed())
                }
                sortRecipes(unsortedRecipes)
                loading = false

            } catch {
                recipes = []
                errorDescription = error.localizedDescription
                loading = false
            }
        }
    }
    
    func sortRecipes(_ unsortedRecipes: [Recipe]) {
        switch sortType {
        case .alphabetical:
            recipes = unsortedRecipes.sorted { $0.name < $1.name }
        case .cuisine:
            recipes = unsortedRecipes.sorted { $0.cuisine < $1.cuisine }
        }
    }
}

