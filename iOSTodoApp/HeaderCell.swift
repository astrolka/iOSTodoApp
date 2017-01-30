//
//  HeaderCell.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 29.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
