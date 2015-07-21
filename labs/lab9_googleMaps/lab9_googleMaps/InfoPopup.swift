//
//  companyInfoWindowController.swift
//  CompanyFinder
//
//  Created by X Code User on 7/20/15.
//  Copyright (c) 2015 gvsu.edu.team4. All rights reserved.
//

import UIKit

class InfoPopup: UIView {

    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}