//
//  ContentView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 1/20/24.
//

import SwiftUI
import CoreData

struct MainPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var recipesModel:RecipesModel
    let indigo = Color(red: 0.28627450980392155, green: 0.25882352941176473, blue: 0.8941176470588236)
    var body: some View {
        TabView{
            Group{
                GetRecipeView()
                    .tabItem {
                        Label("Add Recipe", systemImage: "plus.circle")
                    }
                GroceryView()
                    .tabItem {
                        Label("Grocery List", systemImage: "bag")
                    }
            }.toolbarBackground(Color(red: 0.38823529411764707, green: 0.00784313725490196, blue: 0.9372549019607843), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}


#Preview {
    MainPage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
