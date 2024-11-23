//
//  RecipeListView.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/23/24.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var recipesModel:RecipesModel
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85)),GridItem(.adaptive(minimum: 85))]){
            ForEach(recipesModel.recipes){recipe in
                RecipeCardView(name: recipe.name).aspectRatio(2/3, contentMode: .fit)
            }
        }.padding()
    }
}

//#Preview {
////    RecipeListView()
//}
