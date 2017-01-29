//
//  Todo.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 28.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import UIKit

class Todo {
    var text = String()
    
    var isCompleted = Bool()
    var attributedText: NSAttributedString {
        
        let attr = [NSFontAttributeName : UIFont.systemFont(ofSize: 20)] as [String : Any]
        let attStr = NSMutableAttributedString(string: text, attributes: attr)
        if isCompleted {
            attStr.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, attStr.length))
        }
        
        return attStr
    }
    
    
    init(text: String, isCompleted: Bool) {
        self.text = text
        self.isCompleted = isCompleted
    }
    
    init() {
        
    }
    
}
