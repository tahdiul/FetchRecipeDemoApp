//
//  SortType.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/17/25.
//


enum SortType: CaseIterable, Identifiable {
    case alphabetical
    case cuisine
    var id: Self { self }
}