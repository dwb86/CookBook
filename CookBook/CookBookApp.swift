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

    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
