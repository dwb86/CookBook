//
//  IngredientsView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 1/21/24.
//

import SwiftUI

struct IngredientsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
            UITableView.appearance().showsVerticalScrollIndicator = false
        }
    
    var body: some View {
        VStack{
            Text("Ingredients").font(.title)
//                FetchedObjects() {
//                    (recipes: [Recipe]) in
//                    ForEach(recipes, id: \.self){recipe in
//                        let ingredients = recipe.ingredients
//                        ForEach(ingredients, id: \.self){ingredient in
//                            Text("\(ingredient)")
//                        }
//                        
//                    }.ignoresSafeArea()
//                }
        }.navigationTitle("Recipe").navigationBarTitleTextColor(.white)
    }
}

#Preview {
    IngredientsView()
}
