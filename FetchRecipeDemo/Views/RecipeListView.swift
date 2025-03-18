//
//  ContentView.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/7/25.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()

    var body: some View {
        ZStack {
            if viewModel.loading {
                ProgressView()
            }
            
            if !viewModel.loading, viewModel.recipes.isEmpty {
                EmptyStateCell()
                .padding()
            }
            
            if let errorDescription = viewModel.errorDescription {
                ErrorCell(errorDescription: errorDescription)
                .padding()
            }
            
            ScrollView(.vertical) {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(viewModel.recipes, id: \.uuid) { recipe in
                            RecipeCell(recipe: recipe)
                        }
                    } header: {
                        header
                    }
                }
                .padding()
            }
            .clipped()
            .task {
                viewModel.getData()
            }
            .refreshable {
                viewModel.getData()
            }
        }
    }
    
    private var header: some View {
        VStack(spacing: 8) {
            Text("Fetch Recipe Demo App")
                .font(.title)
                .bold()
                .padding(.vertical, 4)
            Picker("Select json data type", selection: $viewModel.recipeJsonType) {
                ForEach(RecipeJsonType.allCases) { option in
                    Text(String(describing: option)).padding(.horizontal, 8)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: viewModel.recipeJsonType) { _, _ in
                viewModel.getData()
            }
            
            HStack {
                Text(String("Sorted by")).frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                Picker("Sorted by", selection: $viewModel.sortType) {
                    ForEach(SortType.allCases) { option in
                        Text(String(describing: option).capitalized).padding(.horizontal, 8)
                    }
                }
                .pickerStyle(.automatic)
                .onChange(of: viewModel.sortType) { _, _ in
                    viewModel.sortRecipes(viewModel.recipes)
                }
                .tint(.brandOrange).labelsVisibility(.visible)
            }
        }
        .padding(.vertical, 8)
        .background(.white)
    }
}


#Preview {
    RecipeListView()
}
