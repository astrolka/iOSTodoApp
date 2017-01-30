//
//  AddTodoController.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 28.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//

import UIKit

class AddTodoController: UIViewController, UITableViewDelegate, UITableViewDataSource, TodoTextCellDelegate {
    
    var arrOfProjects = Array<Project>()
    var checkedIndexPath : IndexPath?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCellNib(name: "HeaderCell", identifier: "Header")
        tableView.tableFooterView = UIView()
        navigationItem.titleView = UILabel.navigationView(title: "Новая задача")
        
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return arrOfProjects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTextCell", for: indexPath) as! TodoTextCell
            cell.delegate = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Project", for: indexPath)
        cell.textLabel?.text = arrOfProjects[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "OpenSans", size: 18)
        if checkedIndexPath == indexPath {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header")
        
        if section == 0 {
            cell?.textLabel?.text = "ЗАДАЧА"
        } else {
            cell?.textLabel?.text = "КАТЕГОРИЯ"
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if checkedIndexPath != indexPath && checkedIndexPath != nil {
            let cell = tableView.cellForRow(at: checkedIndexPath!)
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        
        checkedIndexPath = indexPath
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 75
        } else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    //MARK: - TodoTextCellDelegate
    
    func didChangeTodo(name: String) {
        print("didChangeTodoName")
    }
    
    //MARK: - Actions

    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        tableView.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        tableView.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
}
