//
//  GroceryItem.swift
//  GroceryList
//
//  Created by X Code User on 7/15/15.
//  Copyright (c) 2015 gvsu.edu.team4. All rights reserved.
//

import UIKit

struct GroceryItem {
    var description: String
    var done: Bool
    
    init(description: String) {
        self.description = description
        self.done = false
    }
}
