//
//  Protocols.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 29.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import Foundation

protocol TodoTextCellDelegate: class {
    func didChangeTodo(name: String)
}
