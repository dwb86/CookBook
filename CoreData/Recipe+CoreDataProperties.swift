//
//  Recipe+CoreDataProperties.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/16/24.
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
    
    public override func awakeFromInsert() {
        self.id_ = UUID()
    }

}

extension Recipe : Identifiable {

}
