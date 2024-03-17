//
//  RecipesModel.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/15/24.
//

import Foundation
import CoreData

@MainActor
class RecipesModel:ObservableObject{
    
    @Published private var recipes:[Recipe]
    private let fetchRecipeService = FetchRecipeService()
    
    init() {
        self.recipes = []
    }
    
    func reload(_ context:NSManagedObjectContext){
        let request = Recipe.fetchRequest()
        guard let result = try? context.fetch(request), result.count > 0 else{
            print("Fetch Failed - RecipeModel")
            return
        }
        self.recipes = result
    }
    
    func fetchRecipe(from url:String,context:NSManagedObjectContext,_ completion:@escaping(_ success:Bool, _ recipe:Recipe)->Void) async {
        await fetchRecipeService.fetchRecipe(url: url){success,ingredients,instructions in
            if success {
                let recipe = Recipe(context: context)
                recipe.name = "Temp Title"
                recipe.ingredients = ingredients
                recipe.instructions = instructions
                self.recipes.append(recipe)
                try? context.save()
                completion(success,recipe)
            }else{
                return
            }
        }
    }
    
//    func saveRecipe(_ recipe:Recipe,_ context:NSManagedObjectContext){
//        let newRecipe  = Recipe(context: context)
////        newRecipe.id = recipe.id
//        newRecipe.name = recipe.name
//        newRecipe.ingredients = recipe.ingredients
//        newRecipe.instructions = recipe.instructions
//        try? context.save()
//    }
    
    func deleteRecipe(_ recipe:Recipe,_ context:NSManagedObjectContext){
        let request = Recipe.fetchRequest()
        let predicate = NSPredicate(format: "id_ == %@", recipe.id as CVarArg)
        request.predicate = predicate
        guard let result = try? context.fetch(request), result.count == 1 else{
            return
        }
        if let recipe = result.first{
            context.delete(recipe)
        }
    }
    
}
