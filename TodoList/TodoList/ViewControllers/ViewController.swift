//
//  ViewController.swift
//  TodoList
//
//  Created by elapp on 24/10/2017.
//  Copyright © 2017 elapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let id = "todoListCell"
    var list:List?
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var todoListTableView: UITableView!
    @IBAction func addItemAction(_ sender: UIBarButtonItem) {
        alertDialog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todoListTableView.dataSource = self
        todoListTableView.delegate = self
        
        list = List(items: [])
        loadAndRefresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - DataSource methodes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list!.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        let item = list!.items[indexPath.row]
        
        item.updateStyleIfStatusDone(item: item, cell: cell)
        
        return cell
    }
    
    //MARK - Delegate methodes
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        let item = list!.items[indexPath.row]
        
        item.updateStatus()
        list?.saveItems(items: list!.items, defaults: defaults)
        loadAndRefresh()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            list!.deleteItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
            //defaults
            list!.saveItems(items: list!.items, defaults: defaults)
            loadAndRefresh()
        }else{
            
        }
    }
    
    //Show Popup 'Alert'
    func alertDialog() {
        let alert = UIAlertController(title: "Ajouter un élément", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Annuler", style: .cancel) {
            (action) in print("action annulée")
        }
        
        let addAction = UIAlertAction(title: "Ajouter", style: .default) { (action) in
            let itemText = alert.textFields![0]
            
            self.list!.createItem(item: itemText.text!, defaults: self.defaults)
            self.loadAndRefresh()
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Insérez votre tâche"
        }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func addItemList(text:String) {
        let item = Item(title: text)
        list!.addItem(item: item)
        todoListTableView.reloadData()
    }
    
    func loadAndRefresh() {
        //Updating the list content
        self.list!.items = self.list!.loadItems(defaults: defaults)
        self.todoListTableView.reloadData()
    }
}

