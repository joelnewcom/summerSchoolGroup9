//
//  DetailViewController.swift
//  GroceryList
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 gvsu.edu.team4. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem?
    @IBOutlet weak var cancelButton: UIBarButtonItem?
    @IBOutlet weak var itemDescription: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func save() {
        if let navigationController = self.navigationController
        {
            
            navigationController.popViewControllerAnimated(true)
            let masterController = (navigationController.visibleViewController as! MasterViewController)
            
            masterController.addNewItem(itemDescription!.text!)
        }
    }
    
    @IBAction func cancel() {
        if let navigationController = self.navigationController
        {
            navigationController.popViewControllerAnimated(true)
        }
    }
}

