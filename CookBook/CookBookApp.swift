//
//  CookBookApp.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/15/24.
//

import SwiftUI

@main
struct CookBookApp: App {
    let persistenceController = PersistenceController.shared
    @ObservedObject var recipesModel = RecipesModel()
    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(recipesModel)
        }
    }
}
