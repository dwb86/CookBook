//
//  RecipesView.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/23/24.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        ThemeView(ContentView: {RecipeListView()})
    }
}

#Preview {
    RecipesView()
}
