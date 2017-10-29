//
//  List.swift
//  Todolist
//
//  Created by Elapp on 23/10/2017.
//  Copyright © 2017 Elise Martin. All rights reserved.
//

import Foundation

class List {
    var items: [Item]
    
    init(items:[Item]) {
        self.items = items
    }
    
    func addItem(item:Item) {
        self.items.append(item)
    }
    
    func deleteItem(index:Int){
        self.items.remove(at: index)
    }
}
