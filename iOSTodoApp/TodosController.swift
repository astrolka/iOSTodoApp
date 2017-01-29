//
//  ViewController.swift
//  iOSTodoApp
//
//  Created by Александр Смоленский on 28.01.17.
//  Copyright © 2017 Александр Смоленский. All rights reserved.
//
import UIKit

class TodosController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrOfProjects = Array<Project>()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addProjects()
        
        navigationItem.titleView = UILabel.navigationView(title: "Задачи")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.registerCellNib(name: "HeaderCell", identifier: "Header")
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTodoSegue" {
            let navController = segue.destination as! UINavigationController
            let addTodoController = navController.viewControllers.first as! AddTodoController
            addTodoController.arrOfProjects = arrOfProjects
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrOfProjects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let project = arrOfProjects[section]
        return project.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let todo = arrOfProjects[indexPath.section].todos[indexPath.row]
        cell.contentLabel.attributedText = todo.attributedText
        cell.checkbox.checkState = todo.isCompleted ? .checked : .unchecked
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "Header")
        cell?.textLabel?.text = arrOfProjects[section].title.uppercased()
        
        return cell
    }

    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    //FIX: - Server part
    
    func addProjects() {
        let todo1 = Todo(text: "Buy a new car", isCompleted: true)
        let todo2 = Todo(text: "Find a dog", isCompleted: false)
        let todo3 = Todo(text: "Wash dishes", isCompleted: false)
        let todo4 = Todo(text: "Phone our partner", isCompleted: true)
        let todo5 = Todo(text: "Send fax to Robert", isCompleted: true)
        let todo6 = Todo(text: "Do some sport", isCompleted: true)
        let todo7 = Todo(text: "Go to doctor", isCompleted: false)
        let todo8 = Todo(text: "Find a hobby", isCompleted: true)
        
        let project1 = Project(title: "Home", todos: [todo1, todo2, todo3])
        let project2 = Project(title: "Work", todos: [todo4, todo5])
        let project3 = Project(title: "Stuff", todos: [todo6, todo7, todo8])
        
        arrOfProjects = [project1, project2, project3]
        
    }

}

