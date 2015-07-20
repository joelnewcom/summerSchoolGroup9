//
//  MasterViewController.swift
//  GroceryList
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 gvsu.edu.team4. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MasterViewController: PFQueryTableViewController {

    let groceryItemClass = "GroceryItem"
//    var groceryItems = [GroceryItem]()

    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        self.parseClassName = self.groceryItemClass
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }


    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // delete this later, probably
    }

    // MARK: - Table View
    
    func updateTable() {
        self.loadObjects()
        self.tableView.reloadData()
    }
    
    func addNewItem(description:String) {
        var pfItem = PFObject(className: self.groceryItemClass)
        pfItem["description"] = description
        pfItem["done"] = false
        pfItem.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if success {
                println("item \(description) was successfully saved")
            }
            else {
                println("item \(description) was NOT saved")
            }
        }
        self.updateTable()    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var query = PFQuery(className: self.groceryItemClass)
        query.getObjectInBackgroundWithId(self.objects![indexPath.row].objectId!!, block:
            { (object: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    println("error while updating object \(indexPath.row): \(error!)")
                }
                else if object == nil {
                    println("couldn't update object \(indexPath.row)")
                }
                else {
                    println("updating object \(indexPath.row)")
                    var done: Bool = object!["done"] as! Bool
                    object!["done"] = !done
                    
                    object?.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                        if success && error != nil {
                            println("object \(indexPath.row) successfully updated")
                        }
                        self.updateTable()
                    })
                }
            }
        )
    }

//    @IBAction func readData() {
//        var query = PFQuery(className: self.groceryItemClass)
//        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
//            if objects != nil && error == nil {
//                println("Read \(objects?.count) objects.")
//                for object in objects! {
//                    let description = object.objectForKey("description") as! String
//                    let item = GroceryItem(description: description)
//                    self.groceryItems.append(item)
//                }
//                self.tableView.reloadData()
//            }
//            else {
//                println("Error reading objects: \(error)")
//            }
//        }
//    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let description:String = self.objects![indexPath.row].objectForKey("description") as! String
        let done:Bool = self.objects![indexPath.row].objectForKey("done") as! Bool
        
        cell.textLabel!.text = description
        cell.accessoryType = done ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:{action, indexpath in
            self.removeObjectAtIndexPath(indexPath)
        });
        
        return [deleteRowAction];
    }

    override func removeObjectAtIndexPath(indexPath: NSIndexPath?, animated: Bool) {
        super.removeObjectAtIndexPath(indexPath, animated: true)
    }
}

