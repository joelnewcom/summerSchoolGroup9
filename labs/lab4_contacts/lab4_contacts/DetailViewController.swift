//
//  DetailViewController.swift
//  lab4_contacts
//
//  Created by X Code User on 7/14/15.
//  Copyright (c) 2015 gvsu.edu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            
            //NameLabel.text = detail[0] as? String
            if let label = self.NameLabel {
                label.text = detail[0] as? String
            }
            if let label = self.AddressLabel {
                label.text = detail[1] as? String
            }
            if let label = self.PhoneLabel {
                label.text = detail[2] as? String
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


}

