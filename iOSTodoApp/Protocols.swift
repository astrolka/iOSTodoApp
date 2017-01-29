//
//  Protocols.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 29.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//
import M13Checkbox
import Foundation

protocol TodoCellDelegate: class {
    func checkboxValueChanged(cell: TodoCell, state: M13Checkbox.CheckState)
}

protocol TodoTextCellDelegate: class {
    func didChangeTodo(name: String)
}
