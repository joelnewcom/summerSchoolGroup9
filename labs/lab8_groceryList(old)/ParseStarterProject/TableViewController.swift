//
//  TableViewController.swift
//  lab8_groceryList
//
//  Created by X Code User on 7/20/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TableViewController: PFQueryTableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Groceries"
        self.textKey = "groceries"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "Groceries")
        query.orderByAscending("groceries")
        return query
    }
    
    func addNewItem(desc: String){
        
    }
}

