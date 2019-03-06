import UIKit

class ChecklistTableViewController: UITableViewController ,AddItemViewControllerDelegate{
    var items = [Checklistitems]()
    var row0text = "Walk the dog"
    var row1text = "Brush my teeth"
    var row2text = "Learn IOS development"
    var row3text = "Soccer practice"
    var row4text = "Eat Ice cream"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        for index in 0...4 {
            items.append(Checklistitems())
                      
            if index % 5 == 0 {
                items[index].text = row0text
            }else if index % 5 == 1{
                items[index].text = row1text
            }else if index % 5 == 2{
                items[index].text = row2text
            }else if index % 5 == 3{
                items[index].text = row3text
            }else if index % 5 == 4{
                items[index].text = row4text
            }
        }
      }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Checklistitems", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
       
        return cell
    }
    func configureCheckmark(for cell: UITableViewCell, with item: Checklistitems){
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
//        if indexPath.row == 0{
//            isChecked = row0text.1;
//
//        }else  if indexPath.row == 1{
//            isChecked = row1text.1;
//
//        }else  if indexPath.row == 2{
//            isChecked = row2text.1;
//
//        }else  if indexPath.row == 3{
//            isChecked = row3text.1;
//
//        }else  if indexPath.row == 4{
//            isChecked = row4text.1;
//
//        }
    }
    func configureText (for cell: UITableViewCell, with item: Checklistitems) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleChecked()
             configureCheckmark(for: cell, with: item)
            
//            if indexPath.row == 0{
//                items[indexPath.row].checked = !items[indexPath.row].checked
//            }else if indexPath.row == 1{
//                row1text.1 = !row1text.1
//            }else if indexPath.row == 2{
//                row2text.1 = !row2text.1
//            }else if indexPath.row == 3 {
//                row3text.1 = !row3text.1
//            }else if  indexPath.row == 4{
//                row4text.1 = !row4text.1
//            }
//
           
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = Checklistitems()
        item.text = "I am a new row"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: Checklistitems) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem"{
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }
    
}
