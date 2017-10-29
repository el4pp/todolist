//
//  List+Defaults.swift
//  Todolist
//
//  Created by Elapp on 23/10/2017.
//  Copyright © 2017 Elise Martin. All rights reserved.
//

import Foundation

extension List {
    
    //Create an Item
    func createItem(item:String, defaults:UserDefaults) {
        
        var itemsSaved:[Dictionary<String,Any>] = []
        let newItem = ["title": item, "status": 0] as [String : Any]
        
        //Check existing items in UserDefaults
        if let items = defaults.object(forKey: "items") as? [Dictionary<String,Any>] {
            itemsSaved = items
        }
        
        //Add new item
        itemsSaved.append(newItem)
        
        defaults.set(itemsSaved, forKey: "items")
    }
    
    //Save Items
    func saveItems(items:[Item], defaults:UserDefaults){
        var itemsSaved:[Dictionary<String,Any>] = []
        
        for item in items {
            let i = ["title": item.title, "status": setStatus(item: item)] as [String : Any]
            itemsSaved.append(i)
        }
        
        defaults.set(itemsSaved, forKey: "items")
    }
    
    //Load Items
    func loadItems(defaults:UserDefaults) -> [Item]{
        var items:[Item] = []
        
        if let itemsArray = defaults.object(forKey: "items") as? [Dictionary<String, Any>] {
            for item in itemsArray {
                let i = Item(title: item["title"] as! String)
                i.statusDone = getStatus(itemValue: item["status"] as! Int)
                items.append(i)
            }
        }
        
        return items
    }
    
    /******************************************/
    //          Getter-Setter Status          //
    /******************************************/
    
    func getStatus(itemValue:Int) -> Bool {
        let status = itemValue==1 ? true : false
        return status
    }
    
    func setStatus(item:Item) -> Int {
        let statusValue = item.statusDone ? 1 : 0
        return statusValue
    }
}
