//
//  galaxyCruiser.swift
//  RocketShipDemo
//
//  Created by Joel Neukom on 14/07/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import Foundation

class galaxyCruiser : MannedRocket {
    var weapons:Array<String>
    
    init(weapons:Array<String>, fuel:Int, astronaut1:String, astronaut2:String){
        self.weapons = weapons
        super.init(fuel: fuel, astronaut1: astronaut1, astronaut2:astronaut2)
    }
    
    override func programmableBlastOff(instructions: (Int)-> Void){
        println("starting to test weapons")
        for weapon in self.weapons{
            println(weapon + ": tested and ready")
        }
        instructions(self.fuelTank)
        
    }
}