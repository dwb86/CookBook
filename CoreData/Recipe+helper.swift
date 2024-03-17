//
//  Recipe+helper.swift
//  CookBook
//
//  Created by Dylan Benavides on 3/15/24.
//

import Foundation
import CoreData



extension Recipe{
    
    public var id: UUID {
        get { id_ ?? UUID()  }
        set { id_ = newValue }
    }
    
    var name: String {
        get { name_ ?? ""  }
        set { name_ = newValue }
    }
    
    var instructions:Array<String>  {
        get { instructions_ ?? [] }
        set { instructions_ = newValue }
    }
    
    var ingredients: Array<String> {
        get { ingredients_ ?? [] }
        set { ingredients_ = newValue }
    }
}
