import UIKit

class ShowTodoItemViewController: UIViewController {
    
    var todo:TodoDataStore = TodoDataStore()
    var previousCtrl:TodoTableViewController = TodoTableViewController()
    
    @IBOutlet weak var labelTodo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTodo.text = self.todo.text!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
