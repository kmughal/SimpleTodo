//
//  TodoTableViewController.swift
//  Todo
//
//  Created by macpro on 20/07/2018.
//  Copyright © 2018 macpro. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var todos : [Todo] = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.todos = self.createToDos()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createToDos() -> [Todo] {
        
        return [Todo.init(text:"go to office" ,isImportant: true),Todo.init(text:"go to home" ,isImportant: true),Todo.init(text:"go to bed" ,isImportant: false)]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = self.todos[indexPath.row]
        cell.textLabel?.text =  ( todo.IsImportant ?  "❗️"  : "") +  todo.Text
        return cell
    }
    
    func addNewTodo(newiteM : Todo) -> Void {
        self.todos.append(newiteM)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.todos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: item)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextCtrl = segue.destination as? AddTodoViewController {
            nextCtrl.previousCtrl = self
        }
        
        if let moveCtrl = segue.destination as? ShowTodoItemViewController {
            moveCtrl.previousCtrl = self
            moveCtrl.todo = sender as! Todo
        }
    }

}
