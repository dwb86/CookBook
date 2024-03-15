//
//  GetRecipeBarView.swift
//  RecipeBook
//
//  Created by Dylan Benavides on 3/1/24.
//

import SwiftUI

struct GetRecipeBarView: View {
    @Environment(\.managedObjectContext) var context
    @State private var siteUrl:String = ""
    @State private var ingredients = [String]()
    var body: some View {
        HStack{
            Spacer()
            TextField("Paste URL Here", text: $siteUrl)
                .border(Color(red: 0.983, green: 0.988, blue: 0.993), width: 1)
                .background(Color(red: 0.959, green: 0.969, blue: 0.982))
            NavigationLink(destination:RecipePreviewView()){
                Image("GetRecipeButton")
                    .resizable()
                    .frame(width: 100,height: 40).onTapGesture {
                        print("Add recipe logic")
                    }
            }
            Spacer()
        }
    }
}

#Preview {
    GetRecipeBarView()
}
