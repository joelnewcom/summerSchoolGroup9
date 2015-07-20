//
//  AddViewController.swift
//  lab8_groceryList
//
//  Created by X Code User on 7/20/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class AddViewController: UIViewController {
    
    var objects = [AnyObject]()
    
    //@IBOutlet weak var backButton: UIBarButtonItem!
    //@IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var itemDescription: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func backFunction(sender: AnyObject) {
        if let navigationController = self.navigationController{
            navigationController.popViewControllerAnimated(true)
        }
    }*/
    
    /*@IBAction func saveSunction(sender: AnyObject) {
        if let navigationController = self.navigationController{
            navigationController.popViewControllerAnimated(true)
            let viewController = (navigationController.visibleViewController as! TableViewController)
            viewController.addNewItem(itemDescription.text!)
        }
    }*/
}

