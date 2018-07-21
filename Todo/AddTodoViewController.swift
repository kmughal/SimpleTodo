import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var inputTodo: UITextField!
    
    @IBOutlet weak var inputImportant: UISwitch!
    
    var previousCtrl:TodoTableViewController = TodoTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let text = inputTodo.text  {
            self.previousCtrl.add(text:text,isImportant: inputImportant.isOn)
            navigationController?.popViewController(animated: true)
        }
    }
}
