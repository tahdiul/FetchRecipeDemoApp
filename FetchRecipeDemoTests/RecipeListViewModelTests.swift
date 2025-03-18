//
//  RecipeListViewModelTests.swift
//  FetchRecipeDemoTests
//
//  Created by Tahdiul Haq on 3/17/25.
//

import XCTest
import Combine
@testable import FetchRecipeDemo

@MainActor
final class RecipeListViewModelTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    var recipeListViewModel: RecipeListViewModel = RecipeListViewModel(dataManager: MockDataManager())
    
    func test_getData_withRecipes() async throws {
        
        recipeListViewModel.recipeJsonType = .recipes
        recipeListViewModel.getData()
        let expectation = XCTestExpectation(description: "Wait for data to load")
        
        recipeListViewModel.$loading
            .dropFirst()
            .sink {
                if $0 == false,
                   self.recipeListViewModel.recipes.count > 0,
                   self.recipeListViewModel.errorDescription == nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await fulfillment(of: [expectation] , timeout: 2)
    }

    
    func test_getData_withZeroRecipes() async throws {
        
        recipeListViewModel.recipeJsonType = .noData
        recipeListViewModel.getData()
        let expectation = XCTestExpectation(description: "Wait for data to load")
        
        recipeListViewModel.$loading
            .dropFirst()
            .sink {
                if $0 == false,
                   self.recipeListViewModel.recipes.count == 0,
                   self.recipeListViewModel.errorDescription == nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await fulfillment(of: [expectation] , timeout: 2)
    }
    
    func test_getData_withError() async throws {
        
        recipeListViewModel.recipeJsonType = .malformedJson
        recipeListViewModel.getData()
        let expectation = XCTestExpectation(description: "Wait for data to load")
        
        recipeListViewModel.$loading
            .dropFirst()
            .sink {
                if $0 == false,
                   self.recipeListViewModel.recipes.count == 0,
                   self.recipeListViewModel.errorDescription != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await fulfillment(of: [expectation] , timeout: 2)
    }
    
    func test_sortRecipes_Alphabetical() async throws {
        recipeListViewModel.recipeJsonType = .recipes
        recipeListViewModel.sortType = .alphabetical
        recipeListViewModel.getData()
        let expectation = XCTestExpectation(description: "Wait for data to load")
        
        recipeListViewModel.$loading
            .dropFirst()
            .sink {
                let sorted = self.recipeListViewModel.recipes.sorted(by: {
                    $0.name < $1.name
                })
                print(sorted.map{$0.name})
                if $0 == false,
                   sorted == self.recipeListViewModel.recipes {
                    print(self.recipeListViewModel.recipes.map{$0.name})

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await fulfillment(of: [expectation] , timeout: 2)
    }
    
    func test_sortRecipes_Categorical() async throws {
        recipeListViewModel.recipeJsonType = .recipes
        recipeListViewModel.sortType = .cuisine
        recipeListViewModel.getData()
        let expectation = XCTestExpectation(description: "Wait for data to load")
        
        recipeListViewModel.$loading
            .dropFirst()
            .sink {
                let sorted = self.recipeListViewModel.recipes.sorted(by: {
                    $0.cuisine < $1.cuisine 
                })
                if $0 == false,
                   sorted == self.recipeListViewModel.recipes {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        await fulfillment(of: [expectation] , timeout: 2)
    }

}
