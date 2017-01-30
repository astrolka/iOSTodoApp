//
//  TodoTextCell.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 29.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import UIKit

class TodoTextCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    weak var delegate:TodoTextCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 3
        textField.font = UIFont(name: "OpenSans", size: 20)
        textField.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Actions
    
    @IBAction func textChangedAction(_ sender: UITextField) {
        delegate?.didChangeTodo(name: sender.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
