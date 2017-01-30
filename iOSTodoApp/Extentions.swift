//
//  Extentions.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 29.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import UIKit

extension UILabel {
    
    static func navigationView(title: String) -> UILabel {
        
        let label = UILabel()
        label.text = title
        label.font = UIFont(name: "OpenSans-Light", size: 24)
        label.textColor = UIColor.white
        label.sizeToFit()
        
        return label
    }

}

extension UITableView {
    
    func registerCellNib(name: String, identifier: String) {
        self.register(UINib.init(nibName: name, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
}

