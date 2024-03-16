//
//  Recipe+CoreDataProperties.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/15/24.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id_: UUID?
    @NSManaged public var name_: String?
    @NSManaged public var instructions_: Array<String>?
    @NSManaged public var ingredients_: Array<String>?

}

//extension Recipe : Identifiable {
//
//}
