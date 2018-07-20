//
//  Todo.swift
//  Todo
//
//  Created by macpro on 20/07/2018.
//  Copyright © 2018 macpro. All rights reserved.
//

import Foundation

class Todo {
    
    var Text:String
    var IsImportant:Bool
    
    init(text:String,isImportant:Bool) {
        self.Text = text
        self.IsImportant = isImportant
    }
}
