//
//  Project.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 28.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import Foundation

class Project {
    var title = String()
    var todos = Array<Todo>()
    
    init(title: String, todos:Array<Todo>) {
        self.todos = todos
        self.title = title
    }
    
    init(title: String) {
        self.title = title
    }
    
    init() {
        
    }
}
