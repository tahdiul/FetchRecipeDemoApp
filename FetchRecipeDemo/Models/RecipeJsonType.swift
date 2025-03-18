//
//  RecipeJsonType.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/17/25.
//


enum RecipeJsonType: CaseIterable, Identifiable, CustomStringConvertible, Equatable {
    case recipes
    case noData
    case malformedJson
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .recipes:
            return "All Data"
        case .noData:
            return "No Data"
        case .malformedJson:
            return "Malformed JSON"
        }
    }
}