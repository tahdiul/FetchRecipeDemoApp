//
//  ErrorCell.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/12/25.
//

import SwiftUI

struct ErrorCell: View {
    var errorText: String = "Error Loading Recipes"
    var errorDescription: String? = "Error Description"

    var body: some View {

        VStack {
            Text(errorText)
            .foregroundStyle(.brandRed)
            .frame(maxWidth: .infinity, alignment: .leading)
            if let errorDescription = errorDescription {
                Text(errorDescription)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(.brandBackgroundGrey)
        .cornerRadius(8)
    }
}

#Preview {
    ErrorCell()
}
