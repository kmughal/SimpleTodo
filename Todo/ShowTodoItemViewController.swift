//
//  ShowTodoItemViewController.swift
//  Todo
//
//  Created by macpro on 20/07/2018.
//  Copyright © 2018 macpro. All rights reserved.
//

import UIKit

class ShowTodoItemViewController: UIViewController {
    
    var todo:Todo = Todo.init(text:"",isImportant: false)
    var previousCtrl:TodoTableViewController = TodoTableViewController()
    
    @IBOutlet weak var labelTodo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTodo.text = self.todo.Text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }}
