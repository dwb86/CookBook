//
//  Recipes+CoreDataProperties.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/15/24.
//
//

import Foundation
import CoreData


extension Recipes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipes> {
        return NSFetchRequest<Recipes>(entityName: "Recipes")
    }

    @NSManaged public var id_: UUID?
    @NSManaged public var name_: String?
    @NSManaged public var ingredients_: NSObject?
    @NSManaged public var instructions_: NSObject?

}

extension Recipes : Identifiable {

}
