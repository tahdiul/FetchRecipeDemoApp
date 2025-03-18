//
//  EmptyStateCell.swift
//  FetchRecipeDemo
//
//  Created by Tahdiul Haq on 3/12/25.
//

import SwiftUI

struct EmptyStateCell: View {
    var emptystateText: String = "No recipes found"
    var body: some View {

        Text(emptystateText)
        .frame(maxWidth: .infinity,
                   idealHeight: 60,
                   alignment: .leading)
        .foregroundStyle(.brandDarkGrey)
        .padding(16)
        .background(.brandBackgroundGrey)
        .cornerRadius(8)
    }
}

#Preview {
    EmptyStateCell()
}
