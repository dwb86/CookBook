//
//  IngredientsTestView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 3/1/24.
//

import SwiftUI

struct RecipePreviewView: View {
    @Binding var idPassThrough:UUID
    var body: some View {
        @State var id = idPassThrough
        ThemeView(ContentView: {IngredientsView(id: $id)})
    }
}

//#Preview {
//    RecipePreviewView(recipe: Recipe())
//}
