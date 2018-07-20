//
//  AddTodoViewController.swift
//  Todo
//
//  Created by macpro on 20/07/2018.
//  Copyright © 2018 macpro. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var inputTodo: UITextField!
    
    @IBOutlet weak var inputImportant: UISwitch!
    
    var previousCtrl:TodoTableViewController = TodoTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let text = inputTodo.text  {
        var newTodo = Todo.init(text:text , isImportant: inputImportant.isOn)
        
        self.previousCtrl.addNewTodo(newiteM: newTodo)
        navigationController?.popViewController(animated: true)
        }
    }
    

}
