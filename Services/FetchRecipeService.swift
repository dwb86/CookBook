//
//  FetchRecipeService.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/15/24.
//

import Foundation
import SwiftSoup

protocol FetchRecipeServiceProtocol {
    func fetchRecipe(url:String, _ completion:@escaping(_ success:Bool, _ ingredients:[String],_ instructions:[String])->Void)
}

final class FetchRecipeService:FetchRecipeServiceProtocol{
    
    func fetchRecipe(url:String, _ completion: @escaping (_ success:Bool,_ ingredients:[String],_ instructions:[String]) -> Void) {
        
        let url = URL(string: url)
        guard let url = url else{
            print("Error in Fetch Recipe Service 1")
            return
        }
        
        let request = URLRequest(url: url)
        
        let fetchRecipeTask = Foundation.URLSession.shared.dataTask(with: request){data,response,error in
            guard let data = data, let html = String(data: data, encoding: .utf8)else{
                print("Error in Fetch Recipe Service 2")
                return
            }
            
            do{
                let webPageHtml:Document = try SwiftSoup.parse(html)
                if html.contains("mntl-structured-ingredients__list"){
                    self.parseFromAllRecipes(html: webPageHtml){success,ingredients,instructions in
                        completion(success,ingredients,instructions)
                    }
                }else{
                    //TODO: add an if statement and code for word press
                }
            }catch{
                print("Error in Fetch Recipe Service 3")
                return
            }// TODO: add logic on how to catch errors for this closure
        }
        fetchRecipeTask.resume()
    }
    
    private func parseFromAllRecipes(html:Document, _ completion: @escaping (_ success:Bool,_ ingredients:[String],_ instructions:[String]) -> Void) {
        var ingredients = [String]()
        var instructions = [String]()
        do{
            let ingredientElements:Elements = try html.getElementsByClass("mntl-structured-ingredients__list").select("p")
            for ingredient:Element in ingredientElements.array(){
                try ingredients.append(ingredient.text())
            }
            
            let instructionElements:Elements = try html.getElementsByClass("comp mntl-sc-block-group--LI mntl-sc-block mntl-sc-block-startgroup").select("p")
            for instruction:Element in instructionElements.array(){
                try instructions.append(instruction.text())
            }
            completion(true,ingredients,instructions)
        }catch{
            print("Error in Fetch Recipe Service 4")
        }
    }
//    TODO: Make parse function for word press
//    private func parseFromWordPress(html:Document, _ completion: @escaping (_ success:Bool,_ ingredients:[String]) -> Void) {
//        <#code#>
//    }
}
