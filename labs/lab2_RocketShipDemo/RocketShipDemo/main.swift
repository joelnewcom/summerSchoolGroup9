//
//  main.swift
//  RocketShipDemo
//
//  Created by Jonathan Engelsma on 5/18/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import Foundation

var rocket: Rocket = Rocket(fuel: 1000)

rocket.blastOff()

var countDownStr: [String] = ["tien", "negen", "acht", "zeven", "zes", "vijf", "view", "drei", "twee", "een"]

rocket.programmableBlastOff({(Int) -> Void in
    for cstr in countDownStr {
        println(cstr)
    }
    println(">>> blast off!! <<<")
})

rocket.selfDestruct()


var fancyRocket: Rocket = MannedRocket(fuel: 2000, astronaut1: "Sally", astronaut2: "Billy")
fancyRocket.programmableBlastOff({(Int) -> Void in
    for cstr in countDownStr {
        println(cstr)
    }
    println(">>> blast off!! <<<")
})

// Lab2 custom Rocket
var armedRocket: Rocket = galaxyCruiser(weapons: ["gun", "rocket", "amunition", "radar"], fuel: 2000, astronaut1: "Daniel", astronaut2: "Joel")
println("armed Rocket is going to blast Off!")
armedRocket.programmableBlastOff({(Int) -> Void in
    for cstr in countDownStr {
        println(cstr)
    }
    
    println(">>> armedRocket blast off!! <<<")
})
