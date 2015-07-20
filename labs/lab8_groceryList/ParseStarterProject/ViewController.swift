//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testObj = PFObject(className: "WyWidgets")
        testObj["name"]="some fancy Widget"
        testObj["description"]="some fancy Widget"
        
        testObj.saveInBackgroundWithBlock{(success:Bool, error:NSError?) in
            println("data has been saed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

