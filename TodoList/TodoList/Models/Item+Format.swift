//
//  Item+Format.swift
//  Todolist
//
//  Created by Elapp on 17/10/2017.
//  Copyright © 2017 Elise Martin. All rights reserved.
//

import Foundation
import UIKit

extension Item {
    
    public func updateStyleIfStatusDone(item:Item, cell:UITableViewCell) {
        item.statusDone ? ruleOut(text: item.title, cell) : ruleIn(text: item.title, cell)
        cell.accessoryType = item.statusDone ? .checkmark : .none
    }
    
    private func ruleOut(text:String,_ cell:UITableViewCell) {
        var stringFormatted:NSAttributedString?
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.brown,
            NSAttributedStringKey.strikethroughStyle: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue)
        ]
        stringFormatted = NSAttributedString(string: text, attributes: attributes)
        cell.textLabel?.attributedText = stringFormatted
    }
    
    private func ruleIn(text:String,_ cell:UITableViewCell)  {
        var stringFormatted:NSAttributedString?
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.strikethroughStyle: NSNumber(value: 0)
        ]
        stringFormatted = NSAttributedString(string: text, attributes: attributes)
        cell.textLabel?.attributedText = stringFormatted
    }
}
