//
//  GetRecipeBarView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 3/1/24.
//

import SwiftUI

struct GetRecipeBarView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var recipesModel:RecipesModel
    @State private var siteUrl:String = ""
    @State private var ingredients = [String]()
    @State var id = UUID()
    @State var goToRecipeView = false
    var body: some View {
        HStack{
            Spacer()
            TextField("Paste URL Here", text: $siteUrl)
                .border(Color(red: 0.983, green: 0.988, blue: 0.993), width: 1)
                .background(Color(red: 0.959, green: 0.969, blue: 0.982))
            
            Button {
                //Code here before changing the bool value
                Task{
                    await recipesModel.fetchRecipe(from: siteUrl,context: context){success,recipe in
                        if success{
                            print("yess")
                            id = recipe.id
                            goToRecipeView = true
                            
                        }else{
                            print("bleh")
                        }
                    }
                }
                
            } label: {
                Image("GetRecipeButton")
                    .resizable()
                    .frame(width: 100,height: 40)
            }
            Spacer()
        }.navigationDestination(isPresented: $goToRecipeView){
            RecipePreviewView(idPassThrough: $id)
        }
    }
}

//#Preview {
//    GetRecipeBarView()
//}
