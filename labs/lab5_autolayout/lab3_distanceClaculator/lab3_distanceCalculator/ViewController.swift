//
//  ViewController.swift
//  lab3_distanceCalculator
//
//  Created by Joel Neukom & Danny Selgo on 14/07/15.
//  Copyright (c) 2015 Joel Neukom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var resultsField: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func convertToDouble(numberAsString:String)->Double{
        
        var doubleNumber:Double = 0
        if let number = NSNumberFormatter().numberFromString(numberAsString) {
            doubleNumber = number.doubleValue
        }
        return doubleNumber
    }
    
    @IBAction func convertToKilometers(sender: AnyObject) {
        
        var resultString:String
        var doubleVal:Double = convertToDouble(self.textField.text)
        self.textField.resignFirstResponder()
        
        //converting into kilometers
        doubleVal = doubleVal * 1.609344
        resultString = "Distance in Kilometers: \(doubleVal)"
        
        resultsField.text = resultString
        
    }
    @IBAction func clearResultAndTextfield(sender: UIButton) {
        self.textField.resignFirstResponder()
        textField.text = ""
        resultsField.text = ""
    }
    
    
}

