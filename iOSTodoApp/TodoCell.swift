//
//  TodoCell.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 28.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//
import M13Checkbox
import UIKit

class TodoCell: UITableViewCell {
    
    weak var delegate:TodoCellDelegate?
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let checkbox: M13Checkbox = {
        let checkbox = M13Checkbox()
        checkbox.cornerRadius = 1
        checkbox.boxType = .square
        checkbox.stateChangeAnimation = .bounce(.fill)
        checkbox.tintColor = UIColor(red: 66/255, green: 172/255, blue: 232/255, alpha: 1)
        checkbox.checkmarkLineWidth = 4
        return checkbox
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSubviews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setSubviews() {
        addSubview(contentLabel)
        addSubview(checkbox)
        checkbox.addTarget(self, action: #selector(checkMarkAction(_ :)), for: .valueChanged)
        
        let viewsDict = ["v1" : contentLabel, "v2" : checkbox]
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(30)-[v2(25)]-(30)-[v1]-(>=8)-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: viewsDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(>=0)-[v2(25)]-(>=0)-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
    
    //MARK: - Actions
    
    func checkMarkAction(_ sender: M13Checkbox) {
        delegate?.checkboxValueChanged(cell: self, state: checkbox.checkState)
    }
    
    
}
