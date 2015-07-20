//
//  DetailViewController.swift
//  lab08
//
//  Created by X Code User on 7/20/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var backbutton: UIBarButtonItem!
    @IBOutlet weak var itemDescription: UITextField!
    


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.itemDescription {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveFunction(sender: AnyObject) {
        if let navigationController = self.navigationController
        {
            
            navigationController.popViewControllerAnimated(true)
            let masterController = (navigationController.visibleViewController as! MasterViewController)
            
            masterController.addNewItem(itemDescription!.text!)
        }
    }

    @IBAction func backFunction(sender: AnyObject) {
        if let navigationController = self.navigationController
        {
            navigationController.popViewControllerAnimated(true)
        }
    }
}

