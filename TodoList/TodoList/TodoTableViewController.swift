//
//  ViewController.swift
//  TodoList
//
//  Created by Karlis Butins on 04/02/2021.
//

import UIKit
import CoreData

class TodoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var todoList = [Todo]()
    
    var context: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }

    @IBAction func addNewItemTapped(_ sender: Any) {
        addNewItem()
    }
    
    private func addNewItem(){
        
        let alertController = UIAlertController(title: "Add New List", message: "What do you want to add?", preferredStyle: .alert)
        
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Enter the title of your task."
            textField.autocapitalizationType = .sentences
            textField.autocorrectionType = .no
        }
        
        let addAction = UIAlertAction(title: "Add", style: .cancel) { (action: UIAlertAction) in
            let textField = alertController.textFields?.first
            
            let entity = NSEntityDescription.entity(forEntityName: "Todo", in: self.context!)
            let item = NSManagedObject(entity: entity!, insertInto: self.context)
            item.setValue(textField?.text, forKey: "item")
            
            //save func
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true)
        
    }
    
}

//MARK: - Table view data source
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell",for: indexPath)
        return cell
    }
