//
//  MasterViewController.swift
//  lab08
//
//  Created by X Code User on 7/20/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class MasterViewController: PFQueryTableViewController {

    let itemClass = "Groceries"
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        self.parseClassName = self.itemClass
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues
    
    func addNewItem(desc: String){
        var pfItem = PFObject(className: self.itemClass)
        pfItem["description"] = desc
        pfItem["done"] = false
        pfItem.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if success {
                println("item \(desc) was successfully saved")
            }
            else {
                println("item \(desc) was NOT saved")
            }
        }
        self.updateTable()
    }
    
    func updateTable(){
        self.loadObjects()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var query = PFQuery(className: self.itemClass)
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

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let desc:String = self.objects![indexPath.row].objectForKey("description") as! String
        let done:Bool = self.objects![indexPath.row].objectForKey("done") as! Bool
        
        cell.textLabel!.text = desc
        cell.accessoryType = done ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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

