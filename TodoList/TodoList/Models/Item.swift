//
//  Item.swift
//  Todolist
//
//  Created by Elapp on 17/10/2017.
//  Copyright © 2017 Elise Martin. All rights reserved.
//

import Foundation

class Item {
    var title:String
    var statusDone:Bool
    
    init(title:String) {
        self.title = title
        self.statusDone = false
    }
    
    func updateStatus() {
        self.statusDone = self.statusDone ? false : true
    }
    
}
