//
//  IngredientsTestView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 3/1/24.
//

import SwiftUI

struct RecipePreviewView: View {
    var body: some View {
        ThemeView(ContentView: {IngredientsView()})
    }
}

#Preview {
    RecipePreviewView()
}
