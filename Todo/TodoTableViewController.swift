import UIKit

class TodoTableViewController: UITableViewController {
    
    var list : [TodoDataStore] = [TodoDataStore]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.get()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = self.list[indexPath.row]
        cell.textLabel?.text =  ( todo.isImportant ?  "❗️"  : "") +  todo.text!
        return cell
    }
    
    func add(text:String,isImportant:Bool) -> Void {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let item = TodoDataStore(entity: TodoDataStore.entity(), insertInto: context)
            item.text = text
            item.isImportant = isImportant
            do {
                try context.save()
                get()
            }catch let error as NSError { print(error)}
        }
    }
    
    func get() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let result = try? context.fetch(TodoDataStore.fetchRequest()) as? [TodoDataStore] {
                if let data = result {
                   self.list = data
                   self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.list[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextCtrl = segue.destination as? AddTodoViewController {
            nextCtrl.previousCtrl = self
        }
        
        if let moveCtrl = segue.destination as? ShowTodoItemViewController {
            moveCtrl.previousCtrl = self
            moveCtrl.todo = sender as! TodoDataStore
        }
    }
}
